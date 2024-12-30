local lsp = require("lspconfig")

local servers = {
	lua_ls = require("lsp.config.lua_ls"),
}

for name, conf in pairs(servers) do
	lsp[name].setup(conf)
end
