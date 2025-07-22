local capabilities = require("lib.lsp.capabilities")

return {
	-- on_attach = function() end,
	handlers = {
		capabilities = capabilities,
	},
	settings = {
		tsserver_file_preferences = {
			includeCompletionsForModuleExports = true,
			quotePreference = "auto",
		},
		tsserver_format_options = {
			allowIncompleteCompletions = false,
			allowRenameOfImportPath = false,
		},
		code_lens = "off", -- qualquer coisa diferente disso causa falhas
		tsserver_locale = "pt-br",
		jsx_close_tag = {
			enable = true,
			filetypes = { "javascriptreact", "typescriptreact" },
		}
	},
}
