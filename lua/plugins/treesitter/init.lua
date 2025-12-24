return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"hiphish/rainbow-delimiters.nvim",
			event = "VeryLazy",
		},
	},
	lazy = false,
	build = ":TSUpdate",
	config = require("plugins.treesitter.config"),
}
