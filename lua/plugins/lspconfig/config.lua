local lsp = require("lspconfig")

local servers = {
	clangd = require("lsp.config.clangd"),
	gopls = require("lsp.config.gopls"),
	lua_ls = require("lsp.config.lua_ls"),
	nil_ls = require("lsp.config.nil_ls"),
  clojure_lsp = require("lsp.config.clojure_lsp")
}

for name, conf in pairs(servers) do
	lsp[name].setup(conf)
end
