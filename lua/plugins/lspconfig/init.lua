return {
	"neovim/nvim-lspconfig",
	cmd = { "LspInfo", "LspInstall", "LspStart" },
	event = { "BufReadPre", "BufNewFile" },
	opts = require("plugins.lspconfig.config"),
	config = function()
		local lsp = require("lspconfig")
		local servers = {}
		for name, config in pairs(servers) do
			lsp[name].setup(config)
		end
	end,
}
