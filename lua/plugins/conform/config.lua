local cfg = require("config.languages")

local languages = cfg.languages
local enabled = cfg.language_enabled

local biome_chain = { "biome", "biome-check", "biome_organize" }

-- map linguagem -> filetypes
local ft_map = {
	go = { "go" },
	java = { "java" },
	lua = { "lua" },
	sql = { "sql" },
	python = { "python" },
	php = { "php" },
	vue = { "html", "css", "javascript", "typescript" },
	angular = { "htmlangular" },
	yaml = { "yaml" },
}

local formatters_by_ft = {}

for lang, config in pairs(languages) do
	if not enabled[lang] then
		goto continue
	end

	local fts = ft_map[lang]
	if not fts then
		goto continue
	end

	for _, ft in ipairs(fts) do
		-- prioridade: format definido na linguagem
		if config.format and #config.format > 0 then
			formatters_by_ft[ft] = vim.deepcopy(config.format)
		else
			-- fallback para LSP
			formatters_by_ft[ft] = { lsp_format = "fallback" }
		end
	end

	::continue::
end

return {
	formatters_by_ft = formatters_by_ft,

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

