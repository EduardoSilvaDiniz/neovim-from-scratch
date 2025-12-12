local capabilities = require("lib.lsp.capabilities")

vim.lsp.config("cssls", {
	capabilities = capabilities,
})
