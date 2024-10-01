return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	keys = require("plugins.trouble.keymap"),
	config = function()
		require("plugins.trouble.config")
	end,
}
