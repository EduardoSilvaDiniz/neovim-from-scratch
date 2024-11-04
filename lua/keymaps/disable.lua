local keymap = vim.keymap

keymap.set("n", ":", '<cmd>echo "use ; command"<cr>')
keymap.set("n", "<S-i>", '<cmd>echo "use leader + m + h!!"<cr>')
keymap.set("n", "<S-a>", '<cmd>echo "use leader + m + l!!"<cr>')
keymap.set("n", "<S-s>", '<cmd>echo "use leader + m + s!!"<cr>')
keymap.set("n", "<S-c>", '<cmd>echo "use leader + m + c!!"<cr>')
keymap.set("n", "<S-v>", '<cmd>echo "use leader + m + v!!"<cr>')
keymap.set("n", "<C-c>", '<cmd>echo "use C + up/down!!"<cr>')
keymap.set("n", "<C-z>", '<cmd>echo "suspend disable!!"<CR>')
keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
