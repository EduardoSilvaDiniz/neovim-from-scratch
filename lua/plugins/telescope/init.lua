return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-tree/nvim-web-devicons",
		"scottmckendry/telescope-resession.nvim",
		"nvim-telescope/telescope-frecency.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{
			"crusj/bookmarks.nvim",
			branch = "main",
			opts = {},
		},
	},
	config = function()
		require("plugins.telescope.config")
		require("telescope").load_extension("ui-select")
		require("telescope").load_extension("frecency")
		require("telescope").load_extension("bookmarks")
	end,
}
