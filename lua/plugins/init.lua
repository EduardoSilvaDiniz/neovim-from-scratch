local lib = require("lib.plugin_loader")

local function loadPlugins()
	local list = lib.findFiles("plugins")
	local pathList = lib.createList(list, { "config", "keymap", "plugins.init" })
	local plugins = lib.createTable(pathList)

	return plugins
end

return loadPlugins()
