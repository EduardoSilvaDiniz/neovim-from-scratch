local PluginLoader = require("lib.plugin_loader")

local pluginLoader = PluginLoader.new("/lua/plugins", {
	"config",
	"keymap",
	"plugins.init",
})

return pluginLoader:create_plugins_table()
