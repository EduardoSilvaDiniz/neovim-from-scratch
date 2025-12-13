local config = require("lib.lsp.config")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	callback = function(event)
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = event.buf,
			callback = vim.lsp.buf.document_highlight,
		})

		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			buffer = event.buf,
			callback = vim.lsp.buf.clear_references,
		})

		vim.api.nvim_create_autocmd("LspDetach", {
			callback = function(event2)
				vim.lsp.buf.clear_references()
			end,
		})

		local keymaps = require("lib.lsp.keymap")
		local loadkeys = require("lib.loadkeys")
		loadkeys.manual_load(keymaps, nil)

		vim.diagnostic.config(config)
	end,
})
