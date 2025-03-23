vim.api.nvim_create_autocmd("DirChanged", {
	desc = "loading session",
	pattern = "*",
	callback = function()
		vim.keymap.set("n", "tn", "<cmd>Neotree reveal<cr>", { noremap = true })
	end,
})
