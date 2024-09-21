local M = {}

function M.with(handlers)
	local _handlers = {}
	for _, handler in ipairs(handlers) do
		_handlers = vim.tbl_extend("keep", _handlers, handler)
	end
	return _handlers
end

M.publishDiagnostics = {
	["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		underline = true,
		signs = true,
	}),
}

M.hover = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
}

return M