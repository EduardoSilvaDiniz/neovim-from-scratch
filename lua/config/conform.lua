return {
	formatters_by_ft = {
		go = { "goimports", "gofumpt", "golines" },
		java = { "google_java_format" },
		lua = { "stylua" },
		typescript = { "prettierd" },
		vue = { "prettierd" },
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
		biome_organize = {
			command = "biome",
			args = {
				"format",
				"--organize-imports",
				"--stdin-file-path",
				"$FILENAME",
			},
			stdin = true,
		},
	},
}
