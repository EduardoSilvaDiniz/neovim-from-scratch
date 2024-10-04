local lint = require("lint")

lint.linters_by_ft = {
	markdown = { "vale" },
	go = { "golangcilint" },
	html = { "htmlhint" },
	json = { "jsonlint" },
	javascript = { "jshint" },
	java = { "checkstyle" },
	php = { "phpcs", "phpinsights", "phpmd", "php", "phpstan" },
	cmake = { "cmakelint" },
	shellscript = { "shellcheck" },
	nix = { "nix", "deadnix" },
	yuck = { "yuck" },
}
