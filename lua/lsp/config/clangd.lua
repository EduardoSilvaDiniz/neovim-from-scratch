local handler = require("lsp.handler")
-- local attach = require("lsp.attach")
local capabilities = require("lsp.capability")
-- local clangd_ext_handler = require("lsp-status").extensions.clangd.setup()

return {
  --TODO Algo esta errado, o clangd esta chamando bibliotecas c++ em codigo C
	-- cmd = {
	-- 	"clangd",
	-- 	"--background-index",
	-- 	"--clang-tidy",
	-- 	"--completion-style=bundled",
	-- 	"--cross-file-rename",
	-- 	"--header-insertion=iwyu",
	-- },
	capabilities = capabilities,
	handlers = handler.with({ handler.hover, handler.publishDiagnostics }),

	init_options = {
		clangdFileStatus = true,
		usePlaceholders = true,
		completeUnimported = true,
		semanticHighlighting = true,
	},
}
