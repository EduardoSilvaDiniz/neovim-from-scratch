local M = {}
M.setup = function()
	return {
		bind = true,
		floating_window = true,
		hint_enable = false,
		doc_lines = 0,
		hint_prefix = "🔍 ",
		handler_opts = {
			border = "rounded",
		},
	}
end

return M
