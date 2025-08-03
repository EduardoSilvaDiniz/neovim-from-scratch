local M = {}


local status, _ = pcall(require, "cmp_nvim_lsp")
if status then
	M = require('blink.cmp').get_lsp_capabilities()
end

M.textDocument.completion.completionItem.snippetSupport = false

return M
