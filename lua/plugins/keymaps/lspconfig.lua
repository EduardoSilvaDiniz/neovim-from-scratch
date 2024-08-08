local telescopeBuiltin = require("telescope.builtin")

return {
  "neovim/nvim-lspconfig",
  keys = {
    { 'gD',         vim.lsp.buf.declaration,                        desc = 'LSP: ' .. '[G]oto [D]eclaration' },
    { 'gd',         telescopeBuiltin.lsp_definitions,               desc = 'LSP: ' .. '[G]oto [D]efinition' },
    { 'gr',         telescopeBuiltin.lsp_references,                desc = 'LSP: ' .. '[G]oto [R]eferences' },
    { 'gI',         telescopeBuiltin.lsp_implementations,           desc = 'LSP: ' .. '[G]oto [I]mplementation' },
    { '<leader>D',  telescopeBuiltin.lsp_type_definitions,          desc = 'LSP: ' .. 'Type [D]efinition' },
    { '<leader>ds', telescopeBuiltin.lsp_document_symbols,          desc = 'LSP: ' .. '[D]ocument [S]ymbols' },
    { '<leader>ws', telescopeBuiltin.lsp_dynamic_workspace_symbols, desc = 'LSP: ' .. '[W]orkspace [S]ymbols' },
    { '<leader>rn', vim.lsp.buf.rename,                             desc = 'LSP: ' .. '[R]e[n]ame' },
    { '<leader>ca', vim.lsp.buf.code_action,                        desc = 'LSP: ' .. '[C]ode [A]ction' },
  }
}
