local keymap = vim.keymap

keymap.set("n", "<leader>qq", "<cmd>q!<cr>", { desc = "Force Quit" })
keymap.set("n", "<leader>qs", "<cmd>wq<cr>", { desc = "Save And Quit" })
