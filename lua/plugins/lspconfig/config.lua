local lsp = require("lspconfig")
-- local navic = require("nvim-navic")

local servers = {
	clangd = require("lsp.config.clangd"),
	gopls = require("lsp.config.gopls"),
	lua_ls = require("lsp.config.lua_ls"),
	nil_ls = require("lsp.config.nil_ls"),
}

for name, conf in pairs(servers) do
	-- conf = vim.tbl_extend(conf, navic.attach(client, bufnr))
	lsp[name].setup(conf)
end
