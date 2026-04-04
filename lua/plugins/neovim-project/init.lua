return {
	"coffebar/neovim-project",
	lazy = false,
	priority = 100,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"Shatur/neovim-session-manager",
		"ibhagwan/fzf-lua",
	},
	keys = {
		{ "<leader>pp", "<cmd>NeovimProjectDiscover<cr>", desc = "menu de projetos" },
		{ "<leader>ql", "<cmd>NeovimProjectLoadRecent<cr>", desc = "restaurar ultima sessão" },
	},
	opts = require("plugins.neovim-project.config"),
}
