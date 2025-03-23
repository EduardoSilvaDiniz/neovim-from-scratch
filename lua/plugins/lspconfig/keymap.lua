local builtin = require("telescope.builtin")

return {
	{ "gd",         builtin.lsp_definitions,               { desc = "[G]oto [D]efinition" } },
	{ "gr",         builtin.lsp_references,                { desc = "[G]oto [R]eferences" } },
	{ "gI",         builtin.lsp_implementations,           { desc = "[G]oto [I]mplementation" } },
	{ "gD",         vim.lsp.buf.declaration,               { desc = "[G]oto [D]eclaration" } },
	{ "<leader>D",  builtin.lsp_type_definitions,          { desc = "Type [D]efinition" } },
	{ "<leader>ds", builtin.lsp_document_symbols,          { desc = "[D]ocument [S]ymbols" } },
	{ "<leader>ws", builtin.lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" } },
	{ "<leader>cr", vim.lsp.buf.rename,                    { desc = "Rename" } },
	{ "<leader>ca", vim.lsp.buf.code_action,               { desc = "Do action" },              { "n", "x" } },
	{ "<leader>f",  vim.lsp.buf.format,                    { desc = "Format buffer " } },
	{
		"<leader>th",
		function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
		end,
		{ desc = "[T]oggle Inlay [H]ints" },
	},
}
