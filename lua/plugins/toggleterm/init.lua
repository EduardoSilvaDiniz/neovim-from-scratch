return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = require("plugins.toggleterm.config"),
	config = vim.schedule(function()
		local keymaps = require("plugins.toggleterm.keymap")
		local loadkeys = require("lib.loadkeys")
		loadkeys.manual_load(keymaps)
	end),
}
