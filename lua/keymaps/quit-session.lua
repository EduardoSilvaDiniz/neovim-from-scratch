local keymap = vim.keymap

keymap.set("n", "<leader>qq", "<cmd>q<cr>", { desc = "Quit neovim" })
keymap.set("n", "<leader>qs", "<cmd>q!<cr>", { desc = "Quit neovim without saving" })
keymap.set("n", "<leader>qr", '<cmd>echo "comando não encontrado"<cr>', { desc = "Restart & restore neovim" })
keymap.set("n", "<leader>qR", '<cmd>echo "comando não encontrado"<cr>', { desc = "Restart neovim" })
keymap.set("n", "<leader>ql", "<cmd>NeovimProjectLoadRecent<cr>", { desc = "Restore last session" })
