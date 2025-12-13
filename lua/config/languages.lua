---@class M
---@field language_enabled table
---@field languages table
local M = {}

---@class language_enabled
---@field name boolean
M.language_enabled = {
	php = true,
	go = false,
	java = false,
	python = false,
	lua = true,
	vue = true,
	angular = true,
	c = false,
}

---@class languages
---@field lsp table<string>
---@field dap table<string>
---@field format table<string>
---@field lint table<string>
M.languages = {
	php = {
		lsp = {
			"intelephense",
		},
		dap = {},
		format = {},
		lint = {},
	},

	go = {
		lsp = {
			"gopls",
		},
		dap = {
			"go-debug-adapter",
		},
		format = {
			"gofumpt",
			"goimports",
			"golines",
		},
		lint = {},
	},

	java = {
		lsp = {
			"jdtls",
		},
		dap = {
			"java-debug-adapter",
			"java-test",
		},
		format = {
			"google-java-format",
		},
		lint = {},
	},

	python = {
		lsp = {
			"pyright",
		},
		dap = {},
		format = {},
		lint = {},
	},

	lua = {
		lsp = {
			{ "lua-language-server", version = "3.16.1" },
		},
		dap = {},
		format = {
			"stylua",
		},
		lint = {
			"luacheck",
		},
	},

	vue = {
		lsp = {
			"vue-language-server",
			"tailwindcss-language-server",
		},
		dap = {},
		format = {},
		lint = {},
	},

	angular = {
		lsp = {
			"angular-language-server",
			"tailwindcss-language-server",
		},
		dap = {},
		format = {},
		lint = {},
	},
}

return M
