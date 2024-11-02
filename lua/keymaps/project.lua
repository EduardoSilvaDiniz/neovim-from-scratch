local keymap = vim.keymap
keymap.set("n", "<leader>pp", "<cmd>Telescope neovim-project discover<CR>", { desc = "Switch project" })
