---@diagnostic disable: undefined-field, unused-local
local lspkind = require("lspkind")
local cmp_function_mapping = require("lib.cmp.function_mapping")
local luasnip = require("luasnip")
local cmp = require("cmp")
local cmp_utils = require("lib.cmp.utils")

return {
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-f"] = cmp.mapping(cmp_function_mapping.luasnip_jump_forward()),
		["<C-b"] = cmp.mapping(cmp_function_mapping.luasnip_jump_backward()),
		["<Tab>"] = cmp.mapping(cmp_function_mapping.luasnip_supertab()),
		["<S-Tab>"] = cmp.mapping(cmp_function_mapping.luasnip_shift_supertab()),
		["<C-l>"] = cmp.mapping.close(),
	},

	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	sources = {
		{
			name = "nvim_lsp",
			max_item_count = 16,
			priority = 8,
			entry_filter = function(entry, ctx)
				if cmp_utils.inside_function_args() then
					local kind = entry:get_kind()
					return kind == cmp.lsp.CompletionItemKind.Variable
				end
				return true
			end,
		},
		{ name = "luasnip", max_item_count = 16, priority = 8 },
		{ name = "path",    max_item_count = 16, priority = 5 },
		{ name = "buffer",  max_item_count = 16, priority = 4 },
	},

	preselect = {
		cmp.PreselectMode.None,
	},

	formatting = {
		format = function(entry, vim_item)
			vim_item = lspkind.cmp_format({
				mode = "symbol_text",
				maxwidth = 30,
				ellipsis_char = "...",
			})(entry, vim_item)

			local fixed_width = 30
			local label = vim_item.abbr
			if #label > fixed_width then
				vim_item.abbr = string.sub(label, 1, fixed_width - 3) .. "..."
			else
				vim_item.abbr = label .. string.rep(" ", fixed_width - #label)
			end

			return vim_item
		end,
	},

	window = {
		completion = cmp.config.window.bordered({
			winhighlight = "Normal:normal,FloatBorder:normal,Search:None",
			col_offset = 0,
			side_padding = 1,
			max_width = 60,
			max_height = 15,
		}),
		documentation = cmp.config.window.bordered({
			winhighlight = "Normal:normal,FloatBorder:normal,Search:None",
			col_offset = 0,
			side_padding = 1,
			max_width = 60,
			max_height = 15,
		}),
	},

	view = {
		entries = {
			follow_cursor = true,
		},
	},

	experimental = {
		ghost_text = false,
		native_menu = false,
	},

	sorting = {
		priority_weight = 1.0,
		comparators = {
			cmp.config.compare.exact,
			cmp.config.compare.recently_used,
			cmp.config.compare.kind,
			cmp.config.compare.score,
			-- cmp.config.compare.locality,
			-- cmp.config.compare.score_offset,
			-- cmp.config.compare.offset,
			-- cmp.config.compare.scopes,
			-- cmp.config.compare.sort_text,
			-- cmp.config.compare.kind,
			-- cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	enabled = function()
		return cmp_utils.is_cmp_enabled()
	end,
}
