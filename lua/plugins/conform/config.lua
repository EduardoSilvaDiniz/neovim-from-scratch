return {
	formatters_by_ft = {
		c = { "clang-format" },
		go = { "goimports", "gofumpt", "golines" },
		java = { "google_java_format" },
		lua = { "stylua" },
		make = { "cmakelint" },
		cmake = { "cmakelint" },
		-- nix = { "alejandra", "deadnix" },
		-- sql = { "sql_formatter" },
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
