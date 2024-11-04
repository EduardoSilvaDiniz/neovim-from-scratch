local keymap = vim.keymap

keymap.set("n", "<leader>ml", "<S-a>", { desc = "End Line" })
keymap.set("n", "<leader>ma", "<S-i>", { desc = "Start Line" })
keymap.set("n", "<leader>ms", "<S-s>", { desc = "delete Line" })
keymap.set("n", "<leader>mc", "<S-c>", { desc = "delete ultil the cursor" })
keymap.set("n", "<leader>mv", "<S-v>", { desc = "visual/line mode" })
