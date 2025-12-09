local biome_chain = { "biome", "biome-check", "biome_organize" }

return {
	formatters_by_ft = {
		-- c = { "clang-format" },
		go = { "goimports", "gofumpt", "golines" },
		java = { "google_java_format" },
		lua = { "stylua" },
		-- make = { "cmakelint" },
		-- cmake = { "cmakelint" },
		-- nix = { "alejandra", "deadnix" },
		sql = { "sql_formatter" },
		typescript = { lsp_format = "fallback" },
		typescriptreact = { lsp_format = "fallback" },
		yaml = biome_chain,
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
