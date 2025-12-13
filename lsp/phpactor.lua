local capabilities = require("lib.lsp.capabilities")

vim.lsp.config("phpactor", {
	capabilities = capabilities,
	handlers = {
		["textDocument/publishDiagnostics"] = function() end,
	},
})
