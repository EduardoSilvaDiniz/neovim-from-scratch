pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")
local builtin = require("telescope.builtin")

return {
	{ "<leader>sf",       builtin.find_files,                    { desc = "arquivos" } },
	{ "<leader>ss",       builtin.lsp_dynamic_workspace_symbols, { desc = "procura simbolos no projeto" } },
	{ "<leader>sg",       builtin.live_grep,                     { desc = "com grep" } },
	{ "<leader>sd",       builtin.diagnostics,                   { desc = "diagnosticos" } },
	{ "<leader><leader>", builtin.resume,                        { desc = "ultima pesquisa" } },
}
