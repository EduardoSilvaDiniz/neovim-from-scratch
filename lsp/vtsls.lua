local capabilities = require("lib.lsp.capabilities")

vim.lsp.config("html", {
	filetypes = { "html", "templ", "htmlangular" },
})
