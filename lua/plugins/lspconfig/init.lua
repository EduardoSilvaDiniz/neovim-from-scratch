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
	config = function()
		require("custom-new.lsp-start-servers")
	end,
}
