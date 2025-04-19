local capabilities = require("lib.capabilities")

return {
	cmd = { "gopls", "serve" },
	capabilities = capabilities,
	settings = {
		gopls = {
			usePlaceholders = true,
			staticcheck = true,
			completeUnimported = true,
			gofumpt = true,
			codelenses = {
				gc_details = true,
				generate = true,
				regenerate_cgo = true,
				-- tidy = true,
				upgrade_dependency = true,
				vendor = true,
			},
			analyses = {
				nilness = true,
				shadow = true,
				unusedparams = true,
				unusedwrite = true,
			},
		},
	},
}
