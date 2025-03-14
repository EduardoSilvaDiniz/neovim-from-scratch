local M = {}
M.setup = function()
	vim.cmd([[
			highlight LspSignatureActiveParameter guibg=#464e54
  		highlight FloatBorder guifg=#d3c6aa guibg=#2d353b
			highlight NormalFloat guibg=#2d353b
		]])
	return {
		bind = true,
		floating_window = true,
		hint_enable = false,
		doc_lines = 0,
		hint_prefix = "🔍 ", -- Ícone opcional
		handler_opts = {
			border = "rounded",
		},
	}
end

return M
