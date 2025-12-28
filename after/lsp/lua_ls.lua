local capabilities = require('blink.cmp').get_lsp_capabilities()
return {
	capabilities = capabilities,
	settings = {
		Lua = {
			semantic = { enable = false },
			hint = { enable = true },
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim", "require" } },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
		},
	},
}
