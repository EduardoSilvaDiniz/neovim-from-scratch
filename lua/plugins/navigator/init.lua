return {
	"ray-x/navigator.lua",
	dependencies = {
		"neovim/nvim-lspconfig",
		{
			"ray-x/guihua.lua",
			run = "cd lua/fzy && make",
		},
	},
	opts = require("plugins.navigator.config"),
}
