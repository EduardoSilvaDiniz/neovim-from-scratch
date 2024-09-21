return {
	"akinsho/bufferline.nvim",
	version = "*",
	keys = require("plugins.bufferline.keymap"),
	config = function()
		require("plugins.bufferline.config")
	end,
}
