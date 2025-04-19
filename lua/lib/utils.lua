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

	if vim.lsp.config[name] then
		vim.list_extend(sources, formatters)
	end
end

--@param path string
function M.is_git_repo(path)
	path = path or vim.fn.expand("%:p:h")
	while path ~= "/" do
		if vim.fn.isdirectory(path .. "/.git") == 1 then
			return true
		end
		path = vim.fn.fnamemodify(path, ":h")
	end
	return false
end

return M
