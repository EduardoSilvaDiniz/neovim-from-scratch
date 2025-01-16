vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.g.have_nerd_font = true

vim.keymap.set("n", "<leader>qq", "<cmd>q<cr>", { desc = "Quit neovim" })
vim.keymap.set("n", "<leader>qs", "<cmd>q!<cr>", { desc = "Quit neovim not saving" })
vim.keymap.set("n", "<leader>ql", "<cmd>NeovimProjectLoadRecent<cr>", { desc = "Restore last session" })
