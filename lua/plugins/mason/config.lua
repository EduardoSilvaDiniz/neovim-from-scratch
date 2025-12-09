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
		-- "clangd", -- desativado porque não estou mais programando em C/C++
		"gopls",
		"jdtls",
		{ "lua-language-server", version = "3.16.1" }, -- foi definido a versão mais nova porque a stable esta com problemas de lib
		-- "nil_ls", -- desativado porque não estou usando Nixos
		"sql-formatter",

		-- formatter
		-- "alejandra",
		-- "checkstyle",
		-- "clang-format",
		-- "cmakelint",
		"gofumpt",
		"goimports",
		"golines",
		"google-java-format",
		"stylua",
		"biome",
	},
	auto_update = true,
	integrations = {
		["mason-lspconfig"] = false,
		["mason-null-ls"] = false,
		["mason-nvim-dap"] = false,
	},
}

return M
