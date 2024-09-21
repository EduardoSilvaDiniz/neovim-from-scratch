local lint = require("lint")

lint.linters_by_ft = {
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
	cmake = { "cmakelint" },
	make = {},
	shellscript = { "shellcheck" },
	nix = { "nil" },
}