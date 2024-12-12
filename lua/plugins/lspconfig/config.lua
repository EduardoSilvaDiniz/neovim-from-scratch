local lsp = require("lspconfig")

local servers = {
  clangd = require("lsp.config.clangd"),
  gopls = require("lsp.config.gopls"),
  lua_ls = require("lsp.config.lua_ls"),
  nil_ls = require("lsp.config.nil_ls"),
  clojure_lsp = require("lsp.config.clojure_lsp"),
  html = require("lsp.config.html"),
  cssls = require("lsp.config.cssls"),
  eslint = require("lsp.config.eslint"),
}

for name, conf in pairs(servers) do
  lsp[name].setup(conf)
end
