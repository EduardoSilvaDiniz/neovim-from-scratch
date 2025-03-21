local capabilities = require("lsp.capabilities")

return {
	capabilities = capabilities,
	settings = {
		typescript = {
			suggest = {
				autoImports = true,
				includeCompletionsForModuleExports = true,
			},
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
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
