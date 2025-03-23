return {
	"gbprod/substitute.nvim",
	opts = require("plugins.substitute.config"),
	config = vim.schedule(function()
		local keymaps = require("plugins.substitute.keymap")
		local loadkeys = require("lib.loadkeys")
		loadkeys.manual_load(keymaps)
	end),
}
