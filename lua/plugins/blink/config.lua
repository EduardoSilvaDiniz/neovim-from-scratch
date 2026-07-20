return {
	enabled = function()
		local disabled_filetypes = { "neo-tree", "NvimTree", "DressingInput" }
		return not vim.tbl_contains(disabled_filetypes, vim.bo.filetype)
	end,

	snippets = {
		preset = "luasnip",
	},
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
