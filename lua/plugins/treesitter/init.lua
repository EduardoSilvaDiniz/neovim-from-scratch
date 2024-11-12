return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		-- "nvim-treesitter/nvim-treesitter-context",
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
