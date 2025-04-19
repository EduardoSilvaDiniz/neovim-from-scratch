vim.api.nvim_create_autocmd("DirChanged", {
	desc = "loading session",
	pattern = "*",
	callback = function()
		local keymaps = require("plugins.neo-tree.keymap")
		local loadkeys = require("lib.loadkeys")
		loadkeys.manual_load(keymaps, "neo-tree")
	end,
})
