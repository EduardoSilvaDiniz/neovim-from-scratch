local PluginLoader = require("lib.plugin_loader")

local pluginLoader = PluginLoader.new("/lua/core/autocmd", nil)

return pluginLoader:create_plugins_table()
