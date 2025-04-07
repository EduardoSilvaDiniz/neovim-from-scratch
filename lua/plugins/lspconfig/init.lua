return {
	"neovim/nvim-lspconfig",
	cmd = { "LspInfo", "LspInstall", "LspStart" },
	event = { "BufReadPre", "BufNewFile" },
	opts = require("plugins.lspconfig.config"),
	config = function()
		local lsp = require("lspconfig")
		local servers = {
			lua_ls = require("lsp.config.lua_ls"),
			nil_ls = require("lsp.config.nil_ls"),
			clangd = require("lsp.config.clangd"),
			gopls = require("lsp.config.gopls"),
			markdown_oxide = require("lsp.config.markdown_oxide"),
		}

		for name, config in pairs(servers) do
			lsp[name].setup(config)
		end
	end,
}
