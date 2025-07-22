return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = require("plugins.harpoon.config"),
	config = vim.schedule(function()
		local keymaps = require("plugins.harpoon.keymap")
		local loadkeys = require("lib.loadkeys")
		loadkeys.manual_load(keymaps, nil)
	end),
}
