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
	config = function()
		require("plugins.treesitter.config")
	end,
}
