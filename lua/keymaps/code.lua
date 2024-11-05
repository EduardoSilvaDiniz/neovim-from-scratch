local keymap = vim.keymap
local builtin = require("telescope.builtin")
--#TODO tirar todos os comandos não encontrando

keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Lsp Execute code action" })

keymap.set("n", "<leader>cc", "<cmd>echo 'comando não encontrado'<cr>", { desc = "Compile" })

keymap.set("n", "<leader>cC", "<cmd>echo 'comando não encontrado'<cr>", { desc = "Recompile" })

keymap.set("n", "<leader>cd", builtin.lsp_definitions, { desc = "Jump to definition" })

keymap.set("n", "<leader>cD", builtin.lsp_references, { desc = "Jump to references" })

keymap.set("n", "<leader>ce", "<cmd>echo 'comando não encontrado<cr>", { desc = "Evaluate buffer/region" })

keymap.set("n", "<leader>cE", "<cmd>echo 'comando não encontrado<cr>", { desc = "Evaluate & replace region" })

keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer/region" })

keymap.set("n", "<leader>ci", builtin.lsp_implementations, { desc = "Find implementations" })

keymap.set("n", "<leader>cj", builtin.lsp_document_symbols, { desc = "Jump to symbol in current" })

keymap.set("n", "<leader>cJ", builtin.lsp_dynamic_workspace_symbols, { desc = "Jump to symbol in any workspace" })

keymap.set("n", "<leader>ck", "<cmd>echo 'comando não encontrado<cr>", { desc = "Jump to decumentation" })

keymap.set("n", "<leader>cl", "<cmd>echo 'comando não encontrado<cr>", { desc = "lsp" })

keymap.set("n", "<leader>co", function()
  --#TODO diminuir a função e tirar ela daqui
	if vim.bo.filetype == "c" or vim.bo.filetype == "cpp" then
		vim.lsp.buf.code_action({
			---@diagnostic disable-next-line: missing-fields
			context = { only = { "quickfix" } },
			apply = true,
		})
	else
		vim.lsp.buf.code_action({
			---@diagnostic disable-next-line: missing-fields
			context = { only = { "source.organizeImports" } },
			apply = true,
		})
	end
end, { desc = "LSP Organize imports" })

keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "LSP Rename" })

keymap.set("n", "<leader>cs", "<cmd>echo 'comando não encontrado<cr>", { desc = "Send to repl" })

keymap.set("n", "<leader>cS", "<cmd>echo 'comando não encontrado<cr>", { desc = "Symbols" })

keymap.set("n", "<leader>ct", builtin.lsp_type_definitions, { desc = "Find type definition" })

keymap.set("n", "<leader>cw", "<cmd>echo 'comando não encontrado<cr>", { desc = "Delete trailing whitespace" })

keymap.set("n", "<leader>cW", "<cmd>echo 'comando não encontrado<cr>", { desc = "Delete trailing newlines" })

keymap.set("n", "<leader>cx", builtin.diagnostics, { desc = "List errors" })

keymap.set("n", "<leader>cll", vim.lsp.buf.declaration, { desc = "LSP: [G]oto [D]eclaration" })
