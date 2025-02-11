local capabilities = require("lsp.capabilities")

return {
	capabilities = capabilities,
	settings = {
		typescript = {
			suggest = {
				autoImports = true,
				includeCompletionsForModuleExports = true,
			},
		},
		javascript = {
			suggest = {
				autoImports = true,
				includeCompletionsForModuleExports = true,
			},
		},
	},
}
