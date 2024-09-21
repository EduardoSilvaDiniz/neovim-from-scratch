return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	dependencies = {
		"echasnovski/mini.icons",
	},
	config = function()
		require("plugins.which-keys.config")
	end,
}
