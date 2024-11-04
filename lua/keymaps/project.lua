local builtin = require("telescope.builtin")
local keymap = vim.keymap

keymap.set("n", "<leader>pp", "<cmd>Telescope neovim-project discover<CR>", { desc = "Switch project" })
keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find file in project" })
keymap.set("n", "<leader>pr", "<cmd>Telescope frecency<cr>", { desc = "Find recent project files" })
keymap.set("n", "<leader>pR", '<cmd>echo "comando nao encontrado"<cr>', { desc = "Run project" })
keymap.set("n", "<leader>pT", '<cmd>echo "comando nao encontrado"<cr>', { desc = "Test project" })
keymap.set("n", "<leader>p.", '<cmd>echo "comando nao encontrado"<cr>', { desc = "Browse project" })
