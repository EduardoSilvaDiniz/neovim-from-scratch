vim.api.nvim_create_autocmd({ "FocusLost", "ModeChanged", "TextChanged", "BufEnter" }, {
	desc = "autosave",
	pattern = "*",
	command = "silent! update",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"php",
		"java",
		"vue",
		"rust",
		"html",
		"css",
		"typescriptreact",
		"javascriptreact",
		"lua",
		"yaml",
		"toml",
		"json",
		"md",
		"go",
		"blade",
		"typescript",
		"javascript",
		"zig",
	},
	callback = function()
		vim.treesitter.start()
		vim.wo.foldmethod = "manual"
		vim.wo.foldexpr = ""
		vim.wo.foldenable = false
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
