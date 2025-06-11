vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "load keymaps to lsp",
	pattern = "*",
	callback = function()
		local keymaps = require("lib.lsp.keymap")
		local loadkeys = require("lib.loadkeys")

		loadkeys.manual_load(keymaps, nil)
		vim.cmd("TSEnable highlight")

		vim.diagnostic.config({
			virtual_text = false,
			virtual_lines = false,
			underline = true,
			update_in_insert = false,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN]  = "",
					[vim.diagnostic.severity.HINT]  = "",
					[vim.diagnostic.severity.INFO]  = "",
				},
				numhl = {
					[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
					[vim.diagnostic.severity.WARN]  = "DiagnosticSignWarn",
					[vim.diagnostic.severity.INFO]  = "DiagnosticSignInfo",
					[vim.diagnostic.severity.HINT]  = "DiagnosticSignHint",
				},
			}
		})
	end,
})
