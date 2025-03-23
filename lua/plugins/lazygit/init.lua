return {
	"kdheepak/lazygit.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	config = vim.schedule(function()
		local keymaps = require("plugins.lazygit.keymap")
		local loadkeys = require("lib.loadkeys")
		loadkeys.manual_load(keymaps)
	end),
}
