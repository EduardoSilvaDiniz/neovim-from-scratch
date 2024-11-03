local lib = require("lib.command")

local function loadPlugins()
	local list = lib.findFiles("keymaps")
	local pathList = lib.createList(list, {"keymaps.init"})
	local plugins = lib.createTable(pathList)

  return plugins
end

return loadPlugins()
