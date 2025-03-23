vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "load keymaps to lsp",
	pattern = "*",
	callback = function(event)
		local keymaps = require("plugins.lspconfig.keymap")
		local loadkeys = require("lib.loadkeys")
		loadkeys.manual_load(keymaps)
	end,
})
