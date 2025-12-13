local capabilities = require("lib.lsp.capabilities")

vim.lsp.config("intelephense", {
	capabilities = capabilities,
	settings = {
		intelephense = {
			format = { enable = false },
			folding = { enable = true },
			environment = {
				includePaths = { "/usr/lib64/php8/extensions" },
			},
			-- possible values: stubs.txt
			stubs = {
				"Core",
				"Reflection",
				"SPL",
				"SimpleXML",
				"ctype",
				"date",
				"exif",
				"filter",
				"hash",
				"imagick",
				"json",
				"pcre",
				"random",
				"standard",
				"dom",
			},
		},
	},
})
