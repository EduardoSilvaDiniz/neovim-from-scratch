local keymap = vim.keymap

keymap.set("n", ";", ":")
keymap.set("n", "gu", "gU", { desc = "uppercase" })
keymap.set("n", "gl", "gu", { desc = "lowercase" })
