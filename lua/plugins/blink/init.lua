return {
	"saghen/blink.cmp",
	version = "1.*",
	build = "cargo build --release",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},
	opts = require("plugins.blink.config"),
	opts_extend = { "sources.default" },
}
