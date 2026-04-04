return {
	"saghen/blink.cmp",
	version = "1.*",
	build = "cargo build --release",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		{
			"rafamadriz/friendly-snippets",
			ft = { "go", "lua", "rust" },
		},
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			dependencies = {
				"rafamadriz/friendly-snippets",
			},
			build = "make install_jsregexp",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
				require("luasnip.loaders.from_vscode").load({ paths = "./snippets" })
			end,
		},
	},
	opts = require("plugins.blink.config"),
	opts_extend = { "sources.default" },
}
