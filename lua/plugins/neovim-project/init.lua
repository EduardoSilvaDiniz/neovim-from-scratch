return {
	"coffebar/neovim-project",
	lazy = false,
	priority = 100,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"Shatur/neovim-session-manager",
		"ibhagwan/fzf-lua",
	},
	opts = require("plugins.neovim-project.config"),
	config = vim.schedule(function()
		local keymaps = require("plugins.neovim-project.keymap")
		local loadkeys = require("lib.loadkeys")
		loadkeys.manual_load(keymaps, nil)
	end),
}
