local M = {}

M = vim.lsp.protocol.make_client_capabilities()
M.textDocument.completion.completionItem.snippetSupport = false

local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status then
	M = cmp_nvim_lsp.default_capabilities(M)
end

return M
