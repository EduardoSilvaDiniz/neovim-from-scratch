M = {}
local telescopeBuiltin = require("telescope.builtin")

local function map(keys, func, desc)
  if keys == nil or func == nil or desc == nil then
    error("keys or func or desc is nil!")
  end

  vim.keymap.set('n', keys, func, { desc = 'LSP: ' .. desc })
end

local function setMapping()
  return {
    callback = function()
      map('gd', telescopeBuiltin.lsp_definitions, '[G]oto [D]efinition')
      map('gr', telescopeBuiltin.lsp_references, '[G]oto [R]eferences')
      map('gI', telescopeBuiltin.lsp_implementations, '[G]oto [I]mplementation')
      map('<leader>D', telescopeBuiltin.lsp_type_definitions, 'Type [D]efinition')
      map('<leader>ds', telescopeBuiltin.lsp_document_symbols, '[D]ocument [S]ymbols')
      map('<leader>ws', telescopeBuiltin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
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
