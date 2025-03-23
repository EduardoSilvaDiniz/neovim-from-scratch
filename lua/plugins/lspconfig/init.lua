return {
	"neovim/nvim-lspconfig",
	cmd = { "LspInfo", "LspInstall", "LspStart" },
	event = { "BufReadPre", "BufNewFile" },
	opts = { inlay_hints = { enable = true } },
	config = function()
		require("plugins.lspconfig.config").setup()
	end,
}
