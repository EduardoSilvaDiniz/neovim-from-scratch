local keymap = vim.keymap
local builtin = require("telescope.builtin")

keymap.set("n", "<leader>bb", builtin.buffers, { desc = "Buffer" })
keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "delete buffer" })
keymap.set("n", "<leader>bs", "<cmd>w<cr>", { desc = "Save Buffer" })
