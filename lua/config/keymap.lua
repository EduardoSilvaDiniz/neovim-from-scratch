local map = vim.keymap.set

map("n", "<leader>qq", "<cmd>q!<cr>", { desc = "force quit vim" })
map("n", "<leader>qs", "<cmd>w<cr>", { desc = "save file" })

map("n", ";", ":", { silent = true, desc = "command line" })
map("n", ":", '<cmd>echo "use ; command"<cr>')
map("n", "<leader>ml", "<S-a>", { desc = "End Line" })
map("n", "<leader>mh", "<S-i>", { desc = "Start Line" })
map("n", "<leader>ms", "<S-s>", { desc = "delete Line" })
map("n", "<leader>mc", "<S-c>", { desc = "delete ultil the cursor" })
map("n", "<leader>mv", "<S-v>", { desc = "visual/line mode" })
map("n", "gu", "gU", { desc = "uppercase" })
map("n", "gl", "gu", { desc = "lowercase" })

map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "delete buffer" })

map("n", "<S-i>", '<cmd>echo "use leader + m + h!!"<cr>')
map("n", "<S-a>", '<cmd>echo "use leader + m + l!!"<cr>')
map("n", "<S-s>", '<cmd>echo "use leader + m + s!!"<cr>')
map("n", "<S-c>", '<cmd>echo "use leader + m + c!!"<cr>')
map("n", "<S-v>", '<cmd>echo "use leader + m + v!!"<cr>')
map("n", "<C-c>", '<cmd>echo "use C + up/down!!"<cr>')
map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

map("n", "<leader>cr", "<cmd>w !node<cr>")
