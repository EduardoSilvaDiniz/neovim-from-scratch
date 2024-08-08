local keymap = vim.keymap

keymap.set("n", "<leader>qq", "<cmd>q!<cr>", { desc = "Force Quit" })
keymap.set("n", "<leader>qs", "<cmd>wq<cr>", { desc = "Save And Quit" })

keymap.set("n", ";", ":")
keymap.set("n", ":", '<cmd>echo "use ; command"<cr>')
keymap.set("n", "<leader>ml", "<S-a>", { desc = "End Line" })
keymap.set("n", "<leader>ma", "<S-i>", { desc = "Start Line" })
keymap.set("n", "<leader>ms", "<S-s>", { desc = "delete Line" })
keymap.set("n", "<leader>mc", "<S-c>", { desc = "delete ultil the cursor" })
keymap.set("n", "<leader>mv", "<S-v>", { desc = "visual/line mode" })
keymap.set("n", "gu", "gU", { desc = "uppercase" })
keymap.set("n", "gl", "gu", { desc = "lowercase" })

keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "delete buffer" })
keymap.set("n", "<leader>bs", "<cmd>w<cr>", { desc = "Save Buffer" })

keymap.set("n", "<S-i>", '<cmd>echo "use leader + m + h!!"<cr>')
keymap.set("n", "<S-a>", '<cmd>echo "use leader + m + l!!"<cr>')
keymap.set("n", "<S-s>", '<cmd>echo "use leader + m + s!!"<cr>')
keymap.set("n", "<S-c>", '<cmd>echo "use leader + m + c!!"<cr>')
keymap.set("n", "<S-v>", '<cmd>echo "use leader + m + v!!"<cr>')
keymap.set("n", "<C-c>", '<cmd>echo "use C + up/down!!"<cr>')
keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
