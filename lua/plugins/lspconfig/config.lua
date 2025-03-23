local lsp = require("lspconfig")
local M = {}

local servers = {
	lua_ls = require("lsp.config.lua_ls"),
	nil_ls = require("lsp.config.nil_ls"),
	clangd = require("lsp.config.clangd"),
	gopls = require("lsp.config.gopls"),
	markdown_oxide = require("lsp.config.markdown_oxide"),
	jsonls = require("lsp.config.jsonls"),
	eslint = require("lsp.config.eslint"),
}

function M.setup()
	for name, conf in pairs(servers) do
		lsp[name].setup(conf)
	end
end

return M
