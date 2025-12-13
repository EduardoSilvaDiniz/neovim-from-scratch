if true then
	return {}
end
return {
	"adalessa/laravel.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-neotest/nvim-nio",
	},
	cmd = { "Laravel" },
	event = { "VeryLazy" },
	opts = require("plugins.laravel.config"),
	config = vim.schedule(function()
		local keymaps = require("plugins.laravel.keymap")
		local loadkeys = require("lib.loadkeys")
		loadkeys.manual_load(keymaps, nil)
	end),
}
