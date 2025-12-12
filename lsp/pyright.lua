local capabilities = require("lib.lsp.capabilities")

vim.lsp.config("pyright",{
	capabilities = capabilities,
})
