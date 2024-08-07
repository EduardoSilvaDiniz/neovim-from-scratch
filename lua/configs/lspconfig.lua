Lspconfig = {}
local builtin = require("telescope.builtin")

function Lspconfig:setMappings()
  Lspconfig:map('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
  Lspconfig:map('gr', builtin.lsp_references, '[G]oto [R]eferences')
  Lspconfig:map('gI', builtin.lsp_implementations, '[G]oto [I]mplementation')
  Lspconfig:map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  Lspconfig:map('<leader>D', builtin.lsp_type_definitions, 'Type [D]efinition')
  Lspconfig:map('<leader>ds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
  Lspconfig:map('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  Lspconfig:map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  Lspconfig:map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  Lspconfig:map('<leader>th', Lspconfig:setOtherMap())
end

function Lspconfig:map(keys, func, desc)
  vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
end

function Lspconfig:setOtherMap()
  local client = vim.lsp.get_client_by_id(event.data.client_id)
  if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
    return function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
    end, '[T]oggle Inlay [H]ints'
  else
    return false
  end
end

return Lspconfig
