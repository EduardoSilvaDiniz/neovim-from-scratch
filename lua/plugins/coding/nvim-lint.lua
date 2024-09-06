return {
	"mfussenegger/nvim-lint",
	dependencies = {
		"rshkarin/mason-nvim-lint",
	},
	config = function()
		require("lint").linters_by_ft = {
			markdown = { "vale" },
			c = { "cppcheck" },
			cpp = { "cppcheck" },
			go = { "golangcilint" },
			html = { "htmlhint" },
			css = {},
			json = { "jsonlint" },
			javascript = { "jshint" },
			java = { "checkstyle" },
			lua = { "luacheck" },
			python = { "ruff" },
			rust = {},
			php = { "phpcs", "phpinsights", "phpmd", "php", "phpstan" },
			dart = { "dart" },
			cmake = { "cmakelint" },
			make = {},
			shellscript = { "shellcheck" },
			nix = { "nil" },
		}
	end,
}
