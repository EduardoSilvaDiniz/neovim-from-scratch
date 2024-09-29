local navic = require("nvim-navic")
local M = {}

function M.with()
	if client.server_capabilities.documentSymbolProvider then
		navic.attach()
	end
end

return M
