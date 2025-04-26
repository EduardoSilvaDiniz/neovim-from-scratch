local ts_utils = require("nvim-treesitter.ts_utils")
local M = {}

function M.is_cmp_enabled()
	local context = require("cmp.config.context")

	if vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt" then
		return false
	end

	if vim.bo.filetype == "neo-tree" then
		return false
	end

	return not (context.in_treesitter_capture("comment") or context.in_syntax_group("Comment"))
end

function M.inside_function_args()
	local node = ts_utils.get_node_at_cursor()
	while node do
		if node:type() == "argument_list" or node:type() == "parameters" or node:type() == "arguments" then
			return true
		end
		node = node:parent()
	end
	return false
end

return M
