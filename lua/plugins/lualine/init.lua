return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"echasnovski/mini.icons",
	},
	config = function()
		require("plugins.lualine.config")
	end,
}
