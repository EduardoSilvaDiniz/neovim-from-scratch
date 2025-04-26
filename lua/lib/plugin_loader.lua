local PluginLoader = {}
PluginLoader.__index = PluginLoader

---@class PluginLoader
---@field dir string
---@field filter_list table<string>

---@param dir string
---@param filter table<string> | nil
function PluginLoader.new(dir, filter)
	local self = setmetatable({}, PluginLoader)
	self.dir = dir
	self.filter_list = filter or {}
	return self
end

function PluginLoader:createTable()
	local list = self:_find_files()
	local path_list = self:_create_list(list)
	local plugins = self:_insert_plugins_table(path_list)

	return plugins
end

---@param path_list table
function PluginLoader:_insert_plugins_table(path_list)
	local plugins = {}

	for _, path in pairs(path_list) do
		local status, plugin = pcall(require, path)
		if not status then
			vim.print("not found plugin " .. path)
		end
		table.insert(plugins, plugin)
	end

	return plugins
end

---@param list table
function PluginLoader:_create_list(list)
	local new_list = {}

	for element in list:lines() do
		element = self:_clear_element(element)

		if self.filter(element) then
			table.insert(new_list, element)
		end
	end

	return new_list
end

function PluginLoader:_find_files()
	local new_list = {}

	for element in pcall(io.popen,"find " .. vim.fn.stdpath("config") .. self.dir .. " -type f") do

		if self.filter(element) then
			table.insert(new_list, element)
		end

		element = self:_clear_element(element)
	end

	return new_list
end

---@param element string
function PluginLoader:_apply_filter(element)
	for _, key in pairs(self.filter) do
		if string.find(element, key) then
			return false
		end
	end

	return true
end

---@param element table
function PluginLoader:_clear_element(element)
	return element:gmatch("%/lua%/(.+).lua$")({ 0 }):gsub("/", ".")
end

return PluginLoader
