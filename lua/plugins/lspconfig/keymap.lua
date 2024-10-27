local telescopeBuiltin = require("telescope.builtin")

return {
	{ "<leader>cD", vim.lsp.buf.declaration, desc = "LSP: " .. "[G]oto [D]eclaration" },
	{ "<leader>cd", telescopeBuiltin.lsp_definitions, desc = "LSP: " .. "[G]oto [D]efinition" },
	{ "<leader>cr", telescopeBuiltin.lsp_references, desc = "LSP: " .. "[G]oto [R]eferences" },
	{ "<leader>cI", telescopeBuiltin.lsp_implementations, desc = "LSP: " .. "[G]oto [I]mplementation" },
	{ "<leader>cdd", telescopeBuiltin.lsp_type_definitions, desc = "LSP: " .. "Type [D]efinition" },
	{ "<leader>css", telescopeBuiltin.lsp_document_symbols, desc = "LSP: " .. "[D]ocument [S]ymbols" },
	{ "<leader>cs", telescopeBuiltin.lsp_dynamic_workspace_symbols, desc = "LSP: " .. "[W]orkspace [S]ymbols" },
	{ "<leader>cn", vim.lsp.buf.rename, desc = "LSP: " .. "[R]e[n]ame" },
	{ "<leader>ca", vim.lsp.buf.code_action, desc = "LSP: " .. "[C]ode [A]ction" },
}
