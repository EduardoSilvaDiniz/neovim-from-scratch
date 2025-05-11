local PluginLoader = require("lib.plugin_loader")

local pluginLoader = PluginLoader.new("/lua/plugins", {
	"config",
	"keymap",
})

return pluginLoader:create_plugins_table()
