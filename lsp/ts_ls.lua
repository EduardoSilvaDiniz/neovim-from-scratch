local capabilities = require("lib.capabilities")

return {
	capabilities = capabilities,
	settings = {
		typescript = {
			tsserver_file_preferences = {
				-- includeInlayParameterNameHints = "all",
				includeCompletionsForModuleExports = true,
				quotePreference = "auto",
			},
			tsserver_format_options = {
				allowIncompleteCompletions = false,
				allowRenameOfImportPath = false,
			},
			tsserver_locale = "pt-br",
			-- code_lens = "all",
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
