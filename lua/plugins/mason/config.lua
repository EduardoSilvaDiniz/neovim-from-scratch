---@class M
---@field lsp table
---@field dap table
---@field null table
local M = {}

M.lsp = {
	ensure_installed = {
		"asm_lsp",
		"gopls",
		"jdtls",
		"lua_ls",
		"rust_analyzer",
	},
	automatic_installation = true,
}

M.dap = {
	ensure_installed = {
		"java-debug-adapter",
		"java-test",
	},
	automatic_installation = true,
}

M.null = {
	ensure_installed = {
		--- Formatter
		"asmfmt",
		"clang-format",
		"prettier",
		"stylua",
		"yaml-language-server",
		"yamlfmt",

		--- Lint
		"checkstyle",
		"editorconfig-checker",
	},
	automatic_installation = true,
}

return M
