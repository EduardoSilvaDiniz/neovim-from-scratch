local capabilities = require("lib.capabilities")

return {
	capabilities = capabilities,
	settings = {
		Lua = {
			hint = { enable = true },
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim", "require" } },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
		},
	},
}
