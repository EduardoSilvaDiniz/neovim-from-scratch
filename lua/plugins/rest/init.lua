return {
	"rest-nvim/rest.nvim",
	dependencies = {
		"rest-nvim/tree-sitter-http",
	},
	config = vim.schedule(function()
		local keymaps = require("plugins.rest.keymap")
		local loadkeys = require("lib.loadkeys")
		loadkeys.manual_load(keymaps)
	end),
}
