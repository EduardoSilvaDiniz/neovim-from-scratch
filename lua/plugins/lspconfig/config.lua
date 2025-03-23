local lsp = require("lspconfig")

local servers = {
	lua_ls = require("lsp.config.lua_ls"),
	nil_ls = require("lsp.config.nil_ls"),
	clangd = require("lsp.config.clangd"),
	gopls = require("lsp.config.gopls"),
	markdown_oxide = require("lsp.config.markdown_oxide"),
	-- ts_ls = require("lsp.config.ts_ls"),
	jsonls = require("lsp.config.jsonls"),
	eslint = require("lsp.config.eslint"),
}

for name, conf in pairs(servers) do
	lsp[name].setup(conf)
end
