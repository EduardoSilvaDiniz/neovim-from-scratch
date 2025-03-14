vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.g.have_nerd_font = true
vim.wo.number = true

local augroup = vim.api.nvim_create_augroup("user_cmds", { clear = true })
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>qq", "<cmd>q<cr>", { desc = "Quit neovim" })
vim.keymap.set("n", "<leader>qs", "<cmd>q!<cr>", { desc = "Quit neovim not saving" })
vim.keymap.set("n", "<leader>ql", "<cmd>NeovimProjectLoadRecent<cr>", { desc = "Restore last session" })
vim.keymap.set("n", "tn", "<cmd>Neotree reveal<cr>", { noremap = true })
vim.keymap.set("n", "<leader>pp", "<cmd>Telescope neovim-project discover<cr>", { desc = "Switch project" })
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find file in project" })
vim.keymap.set("n", "<leader>pr", "<cmd>Telescope frecency<cr>", { desc = "Find recent project files" })
