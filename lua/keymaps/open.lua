local keymap = vim.keymap
local betterTerm = require("betterTerm")

keymap.set({ "n", "t" }, "<leader>ot", betterTerm.open, { desc = "Toggle terminal popup" })
keymap.set({ "n", "t" }, "<leader>oT", betterTerm.select, { desc = "Select terminal" })
keymap.set('n', '<leader>tn', '<cmd>Neotree filesystem reveal left<cr>', { desc = "Toggle tree popup"})
