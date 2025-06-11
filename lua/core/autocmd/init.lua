local PluginLoader = require("lib.plugin_loader")

local pluginLoader = PluginLoader.new("/lua/core/autocmd")

return pluginLoader:create_plugins_table()
