return {
	"coffebar/neovim-project",
	lazy = false,
	priority = 100,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"Shatur/neovim-session-manager",
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
