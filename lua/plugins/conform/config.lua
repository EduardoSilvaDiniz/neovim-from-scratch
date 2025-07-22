-- TODO typescript não tem organizador de imports
-- ao inves disso é usando comandos do typescript-tools
-- https://github.com/pmizio/typescript-tools.nvim
--
-- TSToolsOrganizeImports
-- TSToolsSortImports
-- TSToolsRemoveUnusedImports
-- TSToolsRemoveUnused
-- TSToolsAddMissingImports
--
-- Precisa achar alguma forma de usar os comandos do TSTools
-- e o biome para formata
-- biome tambem possui formatador para imports 
-- https://biomejs.dev/pt-br/assist/actions/organize-imports/
--
-- source.organizeImports.biome
--
-- mas não faço ideia de como usar
local biome_chain = { "biome", "biome-check", "biome-organize-imports" }

return {
	formatters_by_ft = {
		c = { "clang-format", "cppcheck" },
		cloujure = { "clj_kondo" },
		css = biome_chain,
		go = { "goimports", "gofumpt", "golines" },
		html = biome_chain,
		java = { "google-java-format" },
		javascript = biome_chain,
		javascriptreact = biome_chain,
		json = biome_chain,
		lua = { "stylua" },
		make = { "cmakelint" },
		nix = { "alejandra", "deadnix" },
		rust = { "rustfmt", lsp_format = "fallback" },
		sh = { "shfmt" },
		sql = { "sql_formatter" },
		typescript = biome_chain,
		typescriptreact = biome_chain,
		yaml = biome_chain,
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
