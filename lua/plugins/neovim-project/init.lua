return {
	"coffebar/neovim-project",
	lazy = false,
	priority = 100,
	keys = require("plugins.neovim-project.keymap"),
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"Shatur/neovim-session-manager",
		"ibhagwan/fzf-lua",
	},
	opts = {
		projects = {
			"~/Projetos/*",
			"~/.config/nvim",
		},
	},
	init = function()
		vim.opt.sessionoptions:append("globals")
	end,
}
