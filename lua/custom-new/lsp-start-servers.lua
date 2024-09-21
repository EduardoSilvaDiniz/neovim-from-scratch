local M = {}
local lsp = require("lspconfig")

local servers = {
	clangd = require("lsp.config.clangd"),
	gopls = require("lsp.config.gopls"),
}

for name, conf in pairs(servers) do
	lsp[name].setup(conf)
end
