local M = {}

M = vim.lsp.protocol.make_client_capabilities()

local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status then
	M = cmp_nvim_lsp.default_capabilities(M)
end

M.textDocument.completion.completionItem.snippetSupport = false

return M
