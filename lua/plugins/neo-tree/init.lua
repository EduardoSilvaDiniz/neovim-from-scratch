return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		{ "3rd/image.nvim", opts = {} }
	},
	cmd = "Neotree",
	opts = require("plugins.neo-tree.config"),
}
