local lspConfigs = require("custom.lsp-config")
return {
	"neovim/nvim-lspconfig",
	cmd = { "LspInfo", "LspInstall", "LspStart" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		lspConfigs.startCustomServers()
		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = false,
			underline = true,
			signs = true,
		})
	end,
}
