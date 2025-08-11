return {
	"saghen/blink.cmp",
	version = "1.*",
	build = 'cargo build --release',
	opts = require("plugins.blink.config"),
	opts_extend = { "sources.default" },
}
