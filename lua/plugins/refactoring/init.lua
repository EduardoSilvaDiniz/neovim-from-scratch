return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	lazy = false,
	opts = {},

	config = vim.schedule(function()
		local keymaps = require("plugins.refactoring.keymap")
		local loadkeys = require("lib.loadkeys")
		loadkeys.manual_load(keymaps)
	end),
}
