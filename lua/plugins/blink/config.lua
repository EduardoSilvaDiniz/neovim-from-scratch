return {
	keymap = {
		preset = "default",
		["<Tab>"] = {
			function(cmp)
				if cmp.snippet_active() then
					return cmp.accept()
				else
					return cmp.select_and_accept()
				end
			end,
			"snippet_forward",
			"fallback",
		},
		["<S-Tab>"] = { "snippet_backward", "fallback" },
		["<CR>"] = { "select_and_accept", "fallback" },
	},

	appearance = {
		nerd_font_variant = "mono",
	},
	completion = { documentation = { auto_show = false } },

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		providers = {
			snippets = {
				enabled = true,
			},
		},
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
}
