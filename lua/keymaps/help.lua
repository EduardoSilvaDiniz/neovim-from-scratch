local keymap = vim.keymap
local builtin = require("telescope.builtin")

keymap.set("n", "<leader>ho", builtin.help_tags, { desc = "info display manual" })
keymap.set("n", "<leader>hk", builtin.keymaps, { desc = "describe keys" })
keymap.set('n', '<leader>hl', '<cmd>Lazy<cr>', { desc = 'package manager'})
