vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.keymap.set("n", "<leader>tn", "<cmd>Neotree filesystem reveal left<cr>", { desc = "Toggle tree popup" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format buffer" })
vim.keymap.set("n", "<leader>gl", "<cmd>LazyGit<cr>", { desc = "Lazygit" })
