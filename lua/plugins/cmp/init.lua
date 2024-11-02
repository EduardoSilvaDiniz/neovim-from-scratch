return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			dependencies = "rafamadriz/friendly-snippets",
			build = "make install_jsregexp",
		},
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			opts = {},
		},
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"nvim-tree/nvim-web-devicons",
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("plugins.cmp.config")
		require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").load({paths = "./snippets"})
	end,
}
