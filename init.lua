local autoload = require("plugins.autoload")
local rootDir = "/home/edu/.config/nvim/lua/plugins"
autoload.listFilesInDir(rootDir)
require("config.options")
require("config.lazy")
require("config.keymap")
require("config.autocmd")
require("bufferline").setup()
