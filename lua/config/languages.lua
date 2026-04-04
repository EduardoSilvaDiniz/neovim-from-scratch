---@class M
---@field language_enabled table
---@field languages table
local M = {}

---@class language_enabled
---@field name boolean
M.language_enabled = {
	php = false,
	go = false,
	java = false,
	python = true,
	lua = true,
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
			"phpactor",
			"laravel-ls",
			"psalm",
			"stimulus-language-server",
		},
		dap = {},
		format = {
			"phpcbf",
			"pint",
			"php-cs-fixer",
		},
		lint = {
			"phpmd",
			"phpstan",
			"phpcs",
		},
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


}

return M
