return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			auto_install = false,
			highlight = {
				enable = true,
			},
			additional_vim_regex_highlighting = true,
		})
		require("nvim-treesitter").install({
			"javascript",
			"html",
			"css",
			"vue",
			"typescript",
			"php",
			"json",
			"lua",
		})
	end,
}
