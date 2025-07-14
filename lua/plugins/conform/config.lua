local prettier_chain = { "prettierd", "prettier", stop_after_first = true }

return {
	formatters_by_ft = {
		c = { "clang-format", "cppcheck" },
		cloujure = { "clj_kondo" },
		css = prettier_chain,
		go = { "goimports", "gofumpt", "golines" },
		html = prettier_chain,
		java = { "google-java-format" },
		javascript = prettier_chain,
		json = prettier_chain,
		lua = { "stylua" },
		make = { "cmakelint" },
		nix = { "alejandra", "deadnix" },
		rust = { "rustfmt", lsp_format = "fallback" },
		sh = { "shfmt" },
		sql = { "sql_formatter" },
		typescript = prettier_chain,
		yaml = prettier_chain,
	},

	formatters = {
		clj_kondo = {
			command = "clj-kondo",
			args = { "--lint" },
			stdin = false,
		},
		sql_formatter = {
			command = "sql-formatter",
			args = { "-l", "sqlite", "--fix", "$FILENAME" },
			stdin = false,
		},
	},
}
