return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	opts = {},
	config = vim.schedule(function()
		local keymaps = require("plugins.trouble.keymap")
		local loadkeys = require("lib.loadkeys")
		loadkeys.manual_load(keymaps)
	end),
}
