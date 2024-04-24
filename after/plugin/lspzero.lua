local lsp = require('lsp-zero')
local opts = {buffer = bufnr, remap = false}
local keymap = vim.keymap.set
local lspbuf = vim.lsp.buf
local lspdiag = vim.lsp.diagnostic

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {'lua_ls','powershell_es', 'bashls', 'rust_analyzer',
                      'clangd', 'cmake', 'gopls', 'jdtls', 'asm_lsp'},

	handlers = { lsp.default_setup, },
})
lsp.on_attach(function(client, bufnr)
  keymap("n", "gd", function() lspbuf.definition() end, opts)
  keymap("n", "K", function() lspbuf.hover() end, opts)
  keymap("n", "<leader>vws", function() lspbuf.workspace_symbol() end, opts)
  keymap("n", "<leader>vd", function() lspdiag.open_float() end, opts)
  keymap("n", "[d", function() lspdiag.goto_next() end, opts)
  keymap("n", "]d", function() lspdiag.goto_prev() end, opts)
  keymap("n", "<leader>vca", function() lspbuf.code_action() end, opts)
  keymap("n", "<leader>vrr", function() lspbuf.references() end, opts)
  keymap("n", "<leader>vrn", function() lspbuf.rename() end, opts)
  keymap("i", "<C-h>", function() lspbuf.signature_help() end, opts)
end)

lsp.setup()
