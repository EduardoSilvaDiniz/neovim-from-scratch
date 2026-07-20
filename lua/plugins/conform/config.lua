return {
	formatters_by_ft = {
		go = { "gofumpt", "goimports", "golines" },
		rust = { "bacon" },
		java = { "google_java_format" },
		sql = { "sql_formatter" },
		lua = {"stylua"},
		c = {"clang-format"},
		cpp = {"clang-format"},
	},

	formatters = {
		google_java_format = {
			command = "google-java-format",
			args = { "-i", "$FILENAME" },
			stdin = false,
		},
		sql_formatter = {
			command = "sql-formatter",
			args = { "-l", "sqlite", "--fix", "$FILENAME" },
			stdin = false,
		},
	},
}
