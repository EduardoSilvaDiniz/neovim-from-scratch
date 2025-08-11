local M = {
	textDocument = {
		foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		},
	},
}

M = require("blink.cmp").get_lsp_capabilities(M)

return M
