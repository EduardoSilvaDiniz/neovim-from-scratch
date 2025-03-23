return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{
			"nvim-tree/nvim-web-devicons",
			enabled = vim.g.have_nerd_font,
		},
	},
	opts = require("plugins.telescope.config"),
	config = vim.schedule(function()
		local keymaps = require("plugins.telescope.keymap")
		local loadkeys = require("lib.loadkeys")
		loadkeys.manual_load(keymaps)
	end),
}
