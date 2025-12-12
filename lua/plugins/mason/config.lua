---@class M
local M = {}
local config = require("config.languages")
local languages = config.languages
local language_enabled = config.language_enabled

-- Helpers
local function collect(kind)
	local result = {}
	for lang, cfg in pairs(languages) do
		if language_enabled[lang] then
			for _, item in ipairs(cfg[kind] or {}) do
				table.insert(result, item)
			end
		end
	end
	return result
end

-- Mason configs finais
M.dap = {
	ensure_installed = collect("dap"),
	automatic_installation = true,
}

M.tools = {
	ensure_installed = vim.tbl_flatten({
		collect("lsp"),
		collect("format"),
		collect("lint"),
	}),
	auto_update = true,
	integrations = {
		["mason-lspconfig"] = false,
		["mason-null-ls"] = false,
		["mason-nvim-dap"] = false,
	},
}

return M
