local M = {}

M = vim.lsp.protocol.make_client_capabilities()
M.textDocument.completion.completionItem.snippetSupport = false
M = require("cmp_nvim_lsp").default_capabilities(M)

return M
