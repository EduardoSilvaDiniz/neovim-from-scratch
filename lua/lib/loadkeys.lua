local M = {}

local function check_plugin(plugin)
	local status, _ = pcall(require, plugin)
	return status
end

local function map(keys, func, opts, mode)
	mode = mode or "n"
	opts.desc = opts.desc or ""
	opts.noremap = opts.noremap or false
	vim.keymap.set(mode, keys, func, { desc = opts.desc, noremap = opts.noremap })
end

--- carrega todas as keymaps da tabela passada como argumento
--- @param keymaps table
--- @param plugin string | nil
function M.manual_load(keymaps, plugin)
	if plugin == nil or check_plugin(plugin) then
		for _, keymap in ipairs(keymaps) do
			map(unpack(keymap))
		end
	else
		vim.notify("Falha ao carregar keymaps do plugin: " .. plugin, vim.log.levels.ERROR)
	end
end

return M
