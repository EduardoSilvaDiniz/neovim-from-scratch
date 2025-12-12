local capabilities = require("lib.lsp.capabilities")

vim.lsp.config("html", {
	capabilities = capabilities,
	filetypes = { "html", "templ", "htmlangular" },
})
