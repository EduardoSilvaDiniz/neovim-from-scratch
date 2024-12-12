local handler = require("lsp.handler")
local capabilities = require("lsp.capability")

return {
	capabilities = capabilities,
	handlers = handler.with({ handler.hover, handler.publishDiagnostics }),

	init_options = {
		clangdFileStatus = true,
		usePlaceholders = true,
		completeUnimported = true,
		semanticHighlighting = true,
	},
}
