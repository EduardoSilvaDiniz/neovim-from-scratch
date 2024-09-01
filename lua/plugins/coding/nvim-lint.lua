local verSystem = require("custom.verification-nixos")
return {
	"mfussenegger/nvim-lint",
	dependencies = {
		"rshkarin/mason-nvim-lint",
	},
	config = function()
		if verSystem.verificationIsNotNix() then
			require("mason-nvim-lint").setup({
				quiet_mode = true,
			})
		else
			require("lint").linters_by_ft = {
				markdown = { "vale" },
				c = { "cppcheck" },
				cpp = { "cppcheck" },
				go = { "golangcilint" },
				html = { "htmlhint" },
				css = { "" },
				json = { "jsonlint" },
				javascript = { "jshint" },
				java = { "checkstyle" },
				lua = { "luacheck" },
				python = { "ruff" },
				rust = {},
				php = { "phpcs", "phpinsights", "phpmd", "php", "phpstan" },
				dart = {},
				cmake = { "cmakelint" },
				make = {},
				shellscript = { "shellcheck" },
			}
		end
	end,
}
