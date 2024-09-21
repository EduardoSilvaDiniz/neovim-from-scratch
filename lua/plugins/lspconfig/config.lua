local lsp = require("lspconfig")

local servers = {
	clangd = require("lsp.config.clangd"),
	gopls = require("lsp.config.gopls"),
	lua_ls = require("lsp.config.lua_ls"),
}

for name, conf in pairs(servers) do
	lsp[name].setup(conf)
end