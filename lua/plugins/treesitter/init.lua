return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"hiphish/rainbow-delimiters.nvim",
			event = "VeryLazy",
		},
	},
	build = ":TSUpdate",
	opts = require("plugins.treesitter.config"),
}
