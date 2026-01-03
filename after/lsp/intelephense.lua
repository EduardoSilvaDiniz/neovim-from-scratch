local capabilities = require('blink.cmp').get_lsp_capabilities()

-- configuração copiada de 
-- https://github.com/pnx/dotfiles/blob/main/nvim/lua/user/plugins/lang/php/lsp/intelephense.lua
return {
	on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
  end,
	capabilities = capabilities,
	settings = {
		intelephense = {
			files = {
				maxSize = 10000000,
				exclude = {
					"**/.git/**",
					"**/.svn/**",
					"**/.hg/**",
					"**/CVS/**",
					"**/.DS_Store/**",
					"**/node_modules/**",
					"**/bower_components/**",
					"**/vendor/**/{Tests,tests}/**",
					"**/vendor/fakerphp/**",
					"**/.history/**",
					"**/vendor/**/vendor/**",
				},
			},
			completion = {
				maxItems = 40,
			},
			format = { enable = false },
			folding = { enable = true },
			environment = {
				shortOpenTags = true,
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
				"laravel",
			},
		},
	},
}
