local capabilities = require("lib.lsp.capabilities")

return {
	-- on_attach = function() end,
	handlers = {
		capabilities = capabilities,
	},
	settings = {
		publish_diagnostic_on = "all",
		tsserver_file_preferences = {
			includeCompletionsForModuleExports = true,
			quotePreference = "auto",
		},
		tsserver_format_options = {
			allowIncompleteCompletions = false,
			allowRenameOfImportPath = false,
			organizeImportsIgnoreCase = true,
		},
		tsserver_plugins = {
			"@styled/typescript-styled-plugin",
			"typescript-styled-plugin",
			"eslint",
			"@typescript-eslint/parser",
			"@typescript-eslint/eslint-plugin",
			"eslint-plugin-react",
			"eslint-plugin-react-hooks",
		},
		code_lens = "off", -- qualquer coisa diferente disso causa falhas
		tsserver_locale = "pt-br",
		jsx_close_tag = {
			enable = true,
			filetypes = { "javascriptreact", "typescriptreact" },
		},
	},
}
