local function is_enabled()
	local ts_utils = require("nvim-treesitter.ts_utils")
	if vim.tbl_contains({ "DressingInput", "neo-tree" }) then
		return false
	end

	if ts_utils.get_node_at_cursor():type():match("comment") then
		return false
	end

	return true
end

return {
	enabled = function()
		local disabled_filetypes = { "neo-tree", "NvimTree", "DressingInput" } -- Add "neo-tree"
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
	-- completion = {
	-- 	enabled = function()
	-- 		--TODO CORRIGIR ESSE CODIGO
	-- 		return not vim.tbl_contains({ "DressingInput", "neo-tree" })
	-- 	end,
	-- 	-- documentation = { auto_show = false },
	-- },

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		providers = {
			snippets = {
				enabled = true,
			},
			laravel = {
				name = "laravel",
				module = "blink.compat.source",
				score_offset = 95, -- show at a higher priority than lsp
			},
		},
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
}
