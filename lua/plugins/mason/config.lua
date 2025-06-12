---@class M
---@field lsp table
---@field dap table
---@field format table
local M = {}

M.lsp = {
	ensure_installed = {
		"bashls",
		"gopls",
		"jdtls",
		"lua_ls",
		"rust_analyzer",
		"ts_ls",
		"yamlls",
	},
	automatic_installation = true,
}

M.dap = {
	ensure_installed = {
		"go-debug-adapter",
		"java-debug-adapter",
		"java-test",
	},
	automatic_installation = true,
}

M.format = {
	ensure_installed = {
		"alejandra",
		"black",
		"clang-format",
		"clj-kondo",
		"cmakelint",
		"gofumpt",
		"goimports",
		"golines",
		"google-java-format",
		"isort",
		"prettier",
		"pylint",
		"rustfmt",
		"shfmt",
		"sql-formatter",
		"stylua",
	},
	auto_update = true,
	integrations = {
		["mason-lspconfig"] = false,
		["mason-null-ls"] = true,
		["mason-nvim-dap"] = false,
	},
}

return M
