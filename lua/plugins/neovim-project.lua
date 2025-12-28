return {
	"coffebar/neovim-project",
	lazy = false,
	priority = 100,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"Shatur/neovim-session-manager",
	},
	keys = {
		{ "<leader>pp", "<cmd>NeovimProjectDiscover<cr>", desc = "Menu de projetos" },
		{ "<leader>ql", "<cmd>NeovimProjectLoadRecent<cr>", desc = "Restaurar última sessão" },
	},
	opts = {
		projects = {
			"~/Projetos/*",
			"~/.config/nvim",
		},
		picker = {
			type = "telescope",
		},
	},
	init = function()
		vim.opt.sessionoptions:append("globals")
	end,
}
