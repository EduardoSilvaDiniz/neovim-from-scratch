local M = {}

---@param system string
function M.whoa_system(system)
	---@diagnostic disable-next-line: undefined-field
	local uname = vim.loop.os_uname()
	return uname.release:lower():find(system) ~= nil
end

---@param name string
---@param formatters table
---@param sources table
function M.add_formatter_if_lsp(name, sources, formatters)
	if name == "jdtls" then
		if require("lazy.core.config").plugins["nvim-jdtls"] then
			vim.list_extend(sources, formatters)
		end
		return
	end

	local lsps = require("lspconfig.configs")
	if lsps[name] then
		vim.list_extend(sources, formatters)
	end
end

return M
