--if true then
--	return {}
--end
return {
	"nvim-lualine/lualine.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = require("plugins.lualine.config"),
}
