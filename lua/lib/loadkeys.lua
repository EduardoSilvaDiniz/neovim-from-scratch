local M = {}
local keys_auto = {}
local keys_manual = {}

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

--- carrega todas as keymaps da tabela enviada
--- @param keymaps table
function M.manual_load(keymaps)
		for _, keymap in ipairs(keymaps) do
			map(unpack(keymap))
		end
end

function M.autoload()
	for name, keymaps in pairs(keys_auto) do
		if check_plugin(name) then
			for _, keymap in ipairs(keymaps) do
				map(unpack(keymap))
			end
		end
	end
end

return M
