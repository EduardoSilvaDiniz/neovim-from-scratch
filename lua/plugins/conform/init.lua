return {
	"stevearc/conform.nvim",
	opts = require("plugins.conform.config"),
	config = vim.schedule(function()
		local keymaps = require("plugins.harpoon.keymap")
		local loadkeys = require("lib.loadkeys")
		loadkeys.manual_load(keymaps, nil)
	end),
}
