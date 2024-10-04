return {
	"LunarVim/breadcrumbs.nvim",
	dependencies = {
		"SmiteshP/nvim-navic",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("nvim-navic").setup({
			lsp = {
				auto_attach = true,
			},
		})

		require("breadcrumbs").setup()
	end,
}
