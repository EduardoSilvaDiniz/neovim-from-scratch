vim.o.background = "dark"
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.g.have_nerd_font = true
vim.g.editorconfig = true
vim.wo.number = true
vim.lsp.inlay_hint.enable(true)
vim.g.loaded_node_provider = 1
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.opt.signcolumn = "yes:1"
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


require("config.lazy")
require("config.autocmds")

vim.lsp.enable('lua_ls')
vim.lsp.enable('vue_ls')
vim.lsp.enable('vtsls')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('intelephense')
vim.lsp.enable('phpactor')
vim.lsp.enable('emmet_language_server')
vim.lsp.enable('laravel-ls')

vim.keymap.set(
  { "n", "v" },
  "ga",
  vim.lsp.buf.code_action,
  { desc = "LSP Code Action" }
)


vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})
