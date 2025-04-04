local builtin = require("telescope.builtin")

return {
	{ "gD",          vim.lsp.buf.declaration,      { desc = "vai para declaração" } },
	{ "gd",          builtin.lsp_definitions,      { desc = "vai para definição" } },
	{ "gr",          builtin.lsp_references,       { desc = "vai para referencia" } },
	{ "gi",          builtin.lsp_implementations,  { desc = "vai para a implementação" } },
	{ "gt",          builtin.lsp_type_definitions, { desc = "vai para definição de tipo" } },
	{ "ga",          vim.lsp.buf.code_action,      { desc = "ação de codigo" } },
	{ "<C-p>",       vim.diagnostic.goto_prev,     { desc = "vai para diagnostico anterior" } },
	{ "<C-n>",       vim.diagnostic.goto_next,     { desc = "var para proximo diagnostico" } },
	{ "<C-k>",       vim.lsp.buf.signature_help,   { desc = "mostra assinatura de ajuda" } },
	{ "<leader>ds",  builtin.lsp_document_symbols, { desc = "documento dos simbolos" } },
	{ "<leader>f",   vim.lsp.buf.format,           { desc = "formata o buffer" } },
	{ "<leader>cr",  vim.lsp.buf.rename,           { desc = "renomear" } },
	{ "<leader>ca",  vim.lsp.buf.code_action,      { desc = "ação de codigo" } },
	{ "<leader>ct",  vim.lsp.buf.type_definition,  { desc = "vai para definição do tipo" } },
	{ "<leader>cD",  vim.lsp.buf.declaration,      { desc = "vai para declaração" } },
	{ "<leader>cd",  vim.lsp.buf.definition,       { desc = "vai para definição" } },
	{ "<leader>cR",  vim.lsp.buf.references,       { desc = "vai para referencia" } },
	{ "<leader>ci",  vim.lsp.buf.implementation,   { desc = "vai para implementação" } },
	{ "<leader>clr", vim.lsp.stop_client,          { desc = "reinicia" } },
	{ "<leader>cls", vim.lsp.start_client,         { desc = "inicia" } },
	{ "<leader>cd[", vim.diagnostic.goto_prev,     { desc = "pula para anterior" } },
	{ "<leader>cd]", vim.diagnostic.goto_next,     { desc = "pula para proximo" } },
	{ "<leader>cdp", vim.diagnostic.goto_prev,     { desc = "pula para anterior" } },
	{ "<leader>cdn", vim.diagnostic.goto_next,     { desc = "pula para proximo" } },
	{ "<leader>cdL", vim.diagnostic.open_float,    { desc = "Line" } },
	{ "<leader>cdl", vim.diagnostic.setloclist,    { desc = "Loclist" } },
}
