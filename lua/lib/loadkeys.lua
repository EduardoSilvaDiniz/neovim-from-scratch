local M = {}

local function check_plugin(plugin)
	plugin = plugin:gsub("_", "-")
	local status, _ = pcall(require, plugin)
	if status then
		return true
	else
		return false
	end
end

local map = function(keys, func, opts, mode)
	mode = mode or "n"
	opts.desc = opts.desc or ""
	opts.noremap = opts.noremap or false
	vim.keymap.set(mode, keys, func, { desc = opts.desc, noremap = opts.noremap })
end

--- carrega todas as keymaps da tabela passada como argumento
--- @param keymaps table
--- @param plugin string
function M.manual_load(keymaps, plugin)
	if plugin == nil or check_plugin(plugin) then
		for _, keymap in ipairs(keymaps) do
			map(unpack(keymap))
		end
	else
		vim.print("falha ao carrega keymaps do plugin: ", plugin)
	end
end

return M
