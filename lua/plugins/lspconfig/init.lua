return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"ray-x/lsp_signature.nvim",
			event = "VeryLazy",
			opts = {},
		},
	},
	cmd = { "LspInfo", "LspInstall", "LspStart" },
	event = { "BufReadPre", "BufNewFile" },
	keys = require("plugins.lspconfig.keymap"),
	config = function()
		require("plugins.lspconfig.config")
	end,
}
