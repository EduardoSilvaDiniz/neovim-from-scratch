local capabilities = require("lsp.capabilities")

return {
	capabilities = capabilities,
	init_options = {
		clangdFileStatus = true,
		usePlaceholders = true,
		completeUnimported = true,
		semanticHighlighting = true,
	},
}
