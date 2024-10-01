return {
	"neovim/nvim-lspconfig",
	cmd = { "LspInfo", "LspInstall", "LspStart" },
	event = { "BufReadPre", "BufNewFile" },
	keys = require("plugins.lspconfig.keymap"),
	config = function()
		require("plugins.lspconfig.config")
	end,
}
