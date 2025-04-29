local PluginLoader = {}
PluginLoader.__index = PluginLoader

---@class PluginLoader
---@field dir string
---@field filter_list table<string>
---@field create_plugins_table fun(self: PluginLoader): table<any>

---@param dir string
---@param filter table<string> | nil
---@return PluginLoader
function PluginLoader.new(dir, filter)
	local self = setmetatable({}, PluginLoader)
	self.dir = dir
	self.filter_list = filter or {}
	return self
end

---@return table<any>
function PluginLoader:create_plugins_table()
	local plugins = {}
	local handle = io.popen("find " .. vim.fn.stdpath("config") .. self.dir .. " -type f")

	if handle == nil then
		error("Failed to run find command")
	end

	for file in handle:lines() do
		if self:_apply_filter(file) then
			file = file:gmatch("%/lua%/(.+).lua$")({ 0 }):gsub("/", ".")

			local status, plugin = pcall(require, file)

			if not status then
				vim.print("not found plugin " .. file)
				break
			else
				table.insert(plugins, plugin)
			end
		end
	end

	handle:close()
	return plugins
end

---@param file string
---@return boolean
function PluginLoader:_apply_filter(file)
	for _, key in pairs(self.filter_list) do
		if string.find(file, key) then
			return false
		end
	end

	return true
end

return PluginLoader
