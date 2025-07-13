return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter-textobjects",
		{
			"hiphish/rainbow-delimiters.nvim",
			event = "VeryLazy",
		},
	},
	build = ":TSUpdate",
	config = require("plugins.treesitter.config"),
}
