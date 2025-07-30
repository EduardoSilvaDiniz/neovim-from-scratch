---@class M
---@field lsp table
---@field dap table
---@field format table
local M = {}

M.lsp = {
	ensure_installed = {
		"bashls",
		-- "clangd",
		"gopls",
		"golangci_lint_ls",
		-- "jdtls",
		"lua_ls",
		-- "nil_ls",
		-- "rust_analyzer",
	},
	automatic_installation = true,
}

M.dap = {
	ensure_installed = {
		"go-debug-adapter",
		-- "java-debug-adapter",
		-- "java-test",
	},
	automatic_installation = true,
}

M.format = {
	ensure_installed = {
		-- "alejandra",
		-- "clang-format",
		-- "cmakelint",
		"gofumpt",
		"goimports",
		"golines",
		-- "google-java-format",
		-- "rustfmt",
		"shfmt",
		"sql-formatter",
		"stylua",
	},
	auto_update = true,
	integrations = {
		["mason-lspconfig"] = false,
		["mason-null-ls"] = false,
		["mason-nvim-dap"] = false,
	},
}

return M
