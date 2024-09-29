local capabilities = require("lsp.capability")
local handler = require("lsp.handler")

return {
	capabilities = capabilities,
	handlers = handler.with({ handler.hover, handler.publishDiagnostics }),
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
