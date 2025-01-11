vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.g.have_nerd_font = true

local kys = require("core.keymaps")
kys.load_plugins()
