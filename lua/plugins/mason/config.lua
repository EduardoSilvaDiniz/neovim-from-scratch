---@class M
local M = {}

-- Mason configs finais
M.dap = {
	ensure_installed = {
		"go-debug-adapter",
		--"java-debug-adapter",
		--"java-test",
	},
	automatic_installation = true,
}

M.tools = {
	ensure_installed = {
		-- C/C++
		"clangd",
		"clang-format",

		-- Golang
		"gopls",
		"gofumpt",
		"goimports",
		"golines",

		-- Java
		--"jdtls",
		--"google-java-format",

		--Python
		--"pyright",

		-- Lua
		"lua-language-server",
		-- { "lua-language-server", version = "3.16.1" },
		"stylua",
		"luacheck",

		-- Rust
		"rust-analyzer",
		"bacon",
	},
	auto_update = true,
	integrations = {
		["mason-lspconfig"] = false,
		["mason-null-ls"] = false,
		["mason-nvim-dap"] = false,
	},
}

return M
