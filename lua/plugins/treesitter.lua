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
			"dart",
			"javascript",
			"html",
			"css",
			"vue",
			"typescript",
			"php",
			"json",
			"lua",
			"toml",
			"xml",
			"ini",
			"blade",
			"bash",
			"gitignore",
			"markdown",
			"git_config",
			"gitcommit",
			"editorconfig",
			"git_rebase",
			"gitattributes",
		})
	end,
}
