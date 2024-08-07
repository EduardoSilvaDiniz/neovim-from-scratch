M = {}

local map = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = 'LSP: ' .. desc })
end

local function setMapping()
  return {
    callback = function()
      map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
      map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
      map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
      map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
      map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
      map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
      map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    end
  }
end

function M.extendLspAttach()
  vim.api.nvim_create_autocmd('LspAttach', setMapping())
end

function M.extendCapabilities()
  local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
  capabilities.textDocument.completion.completionItem.snippetSupport = false
  return capabilities
end

function M.startCustomServers()
  for _, setup in pairs(require("custom.lsp-config-servers")) do
    setup()
  end
end

return M
