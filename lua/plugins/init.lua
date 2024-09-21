local lib = require("lib.command")

local function tableFactory()
	local pluginsTable = {}
	local files = lib.findFiles()
	for file in files:lines() do
		local pluginPath = lib.clearPath(file)
		if
			not string.find(pluginPath, "config")
			and not string.find(pluginPath, "keymap")
			and not string.find(pluginPath, "plugins.init")
		then
			local status, objPlugin = pcall(require, pluginPath)
			if not status then
				vim.print("not found plugin " .. pluginPath)
			end
			table.insert(pluginsTable, objPlugin)
		end
	end
	return pluginsTable
end

return tableFactory()
