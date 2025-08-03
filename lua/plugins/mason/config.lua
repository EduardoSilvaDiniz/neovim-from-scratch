---@class M
---@field dap table
---@field tools table
local M = {}

M.dap = {
	ensure_installed = {
		"go-debug-adapter",
		"java-debug-adapter",
		"java-test",
	},
	automatic_installation = true,
}

M.tools = {
	ensure_installed = {
		-- Lsp
		"clangd",
		"gopls",
		"jdtls",
		"lua-language-server",
		-- "nil_ls",
		"sqls",

		-- formatter
		-- "alejandra",
		"clang-format",
		"cmakelint",
		"gofumpt",
		"goimports",
		"golines",
		"google-java-format",
		"stylua",
		"checkstyle",
	},
	auto_update = true,
	integrations = {
		["mason-lspconfig"] = false,
		["mason-null-ls"] = false,
		["mason-nvim-dap"] = false,
	},
}

return M
