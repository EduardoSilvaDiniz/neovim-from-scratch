local lsp = require("lspconfig")

local servers = {
	lua_ls = require("lsp.config.lua_ls"),
	nil_ls = require("lsp.config.nil_ls"),
	clangd = require("lsp.config.clangd"),
	gopls = require("lsp.config.gopls"),
}

for name, conf in pairs(servers) do
	lsp[name].setup(conf)
end
