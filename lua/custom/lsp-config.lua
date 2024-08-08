M = {}

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
