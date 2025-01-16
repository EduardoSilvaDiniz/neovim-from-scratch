return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = require("plugins.dashboard.config"),
}
