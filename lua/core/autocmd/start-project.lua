local builtin = require("telescope.builtin")

vim.api.nvim_create_autocmd("DirChanged", {
	desc = "loading session",
	pattern = "*",
	callback = function()
		vim.keymap.set("n", "tn", "<cmd>Neotree reveal<cr>", { noremap = true })
		vim.keymap.set("n", "<leader>pp", "<cmd>Telescope neovim-project discover<cr>", { desc = "Switch project" })
		vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find file in project" })
		vim.keymap.set("n", "<leader>pr", "<cmd>Telescope frecency<cr>", { desc = "Find recent project files" })
	end,
})
