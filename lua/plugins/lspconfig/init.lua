return {
	"neovim/nvim-lspconfig",
	cmd = { "LspInfo", "LspInstall", "LspStart" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("plugins.lspconfig.config")
		require("plugins.lspconfig.keymap")
	end,
}
