vim.api.nvim_create_autocmd("DirChanged", {
	desc = "loading session",
	pattern = "*",
	callback = function()
		local keymaps = {"tn", "<cmd>Neotree reveal<cr>", { noremap = true }}
		local loadkeys = require("lib.loadkeys")
		loadkeys.manual_load(keymaps, "neotree")
	end,
})
