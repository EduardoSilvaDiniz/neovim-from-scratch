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
		{ name = "nvim_lsp", max_item_count = 16, priority = 8 },
		{ name = "luasnip",  max_item_count = 16, priority = 8 },
		{ name = "path",     max_item_count = 16, priority = 5 },
		{ name = "buffer",   max_item_count = 16, priority = 4 },
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

	-- configuration tjdevries
	-- https://github.com/tjdevries/config_manager/blob/78608334a7803a0de1a08a9a4bd1b03ad2a5eb11/xdg_config/nvim/after/plugin/completion.lua
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,

			function(entry1, entry2)
				local _, entry1_under = entry1.completion_item.label:find "^_+"
				local _, entry2_under = entry2.completion_item.label:find "^_+"
				entry1_under = entry1_under or 0
				entry2_under = entry2_under or 0
				if entry1_under > entry2_under then
					return false
				elseif entry1_under < entry2_under then
					return true
				end
			end,

			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	enabled = function()
		return cmp_utils.is_cmp_enabled()
	end,
}
