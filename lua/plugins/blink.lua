return {
	"saghen/blink.cmp",
	version = "1.*",
	build = "cargo build --release",
	dependencies = {
		"rafamadriz/friendly-snippets",
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
		"fang2hou/blink-copilot",
	},

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		snippets = { preset = "luasnip" },
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

		completion = {
			documentation = { auto_show = false },
			menu = {
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind", gap = 1 },
						{ "source_name" },
					},
				},
			},
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer", "copilot" },
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-copilot",
					async = true,
				},
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
