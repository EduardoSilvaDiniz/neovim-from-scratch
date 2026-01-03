vim.api.nvim_create_autocmd(
	{ "FocusLost", "ModeChanged", "TextChanged", "BufEnter" },
	{ desc = "autosave", pattern = "*", command = "silent! update" }
)
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
		-- syntax highlighting, provided by Neovim
		vim.treesitter.start()
		vim.wo.foldmethod = "manual"
		vim.wo.foldexpr = ""
		vim.wo.foldenable = false
		-- folds, provided by Neovim
		-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		-- vim.wo.foldmethod = "expr"
		-- indentation, provided by nvim-treesitter
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
