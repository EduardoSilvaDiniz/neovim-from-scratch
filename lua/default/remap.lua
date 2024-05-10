local keymap = vim.keymap.set;

vim.g.mapleader = " "

keymap("n", "<leader>pv", vim.cmd.Ex)
keymap("n", "<F5>", ':w<CR>:make<CR>')
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>r", ":w<cr>:source %<cr>:PackerSync<cr>", opts)
keymap('n', "<S-b>", '<C-v>', { noremap = true, silent = true })

--vim.keymap.set("n", "<F5>", ':term gcc out -o a.out && ./a.out<CR>')
--vim.api.nvim_set_keymap('n', '<F5>', ':w<CR>:term gcc % -o %:r && ./%:r<CR>i', {noremap = true})
