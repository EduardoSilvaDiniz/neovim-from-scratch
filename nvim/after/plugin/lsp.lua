local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	-- Replace the language servers listed here 
	-- with the ones you want to install
	ensure_installed = {'rust_analyzer', 'clangd', 'cmake', 'gopls', 'jdtls', 'asm_lsp'},
	handlers = {
		lsp.default_setup,
	},
})
lsp.setup()
-- here you can setup the language servers


