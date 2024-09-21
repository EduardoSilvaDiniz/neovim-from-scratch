return {
	"stevearc/conform.nvim",
	lazy = false,
	config = function()
		require("conform").setup({
			notify_on_error = true,
			format_on_save = {
				timeout_ms = 500,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				java = { "google-java-format", "checkstyle" },
				php = { "phpcs" },
				go = { "gofmt", "gofumpt", "gosimports", "goimports-reviser", "golines" },
				html = { "djlint", "htmlbeautifier" },
				css = { "rustywind", "stylelint" },
				cmake = { "cmake_format", "gersemi" },
				make = { "gersemi" },
				shellscript = { "shfmt" },
				nix = { "alejandra" },
			},
		})
	end,
}
