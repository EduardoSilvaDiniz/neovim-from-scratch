local capabilities = require("lsp.capabilities")

return {
	cmd = { "gopls", "serve" },
	capabilities = capabilities,
	settings = {
		gopls = {
			completeUnimported = true,
			gofumpt = true,
			codelenses = {
				gc_details = true,
				generate = true,
				regenerate_cgo = true,
				tidy = true,
				upgrade_dependency = true,
				vendor = true,
			},
			usePlaceholders = true,
			analyses = {
				fieldalignment = true,
				nilness = true,
				shadow = true,
				unusedparams = true,
				unusedwrite = true,
			},
		},
	},
}
