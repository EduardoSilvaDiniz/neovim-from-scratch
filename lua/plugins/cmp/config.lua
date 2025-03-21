local lspkind = require("lspkind")
local cmp_functions = require("lib.cmp_functions")
local luasnip = require("luasnip")
local ts_utils = require("nvim-treesitter.ts_utils")
local cmp = require("cmp")

-- TODO está função quebrou o cmp
-- local function is_activated()
-- 	local context = require("cmp.config.context")
-- 	local disabled = false
-- 	disabled = disabled or (vim.api.nvim_get_option_value("buftype", {}) == "prompt")
-- 	disabled = disabled or (vim.api.nvim_get_option_value("buftype", {}) == "nofile")
-- 	disabled = disabled or (vim.fn.reg_recording() ~= "")
-- 	disabled = disabled or (vim.fn.reg_executing() ~= "")
-- 	disabled = disabled or context.in_treesitter_capture("comment")
-- 	return not disabled
-- end
--

local function inside_function_args()
	local node = ts_utils.get_node_at_cursor()
	while node do
		if node:type() == "argument_list" or node:type() == "parameters" or node:type() == "arguments" then
			return true
		end
		node = node:parent()
	end
	return false
end

return {
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-f"] = cmp_functions.luasnip_jump_forward(),
		["<C-b"] = cmp_functions.luasnip_jump_backward(),
		["<Tab>"] = cmp_functions.luasnip_supertab(),
		["<S-Tab>"] = cmp_functions.luasnip_shift_supertab(),
	},

	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	sources = {
		-- { name = "nvim_lsp", max_item_count = 16 },
		{
			name = "nvim_lsp",
			max_item_count = 16,
			entry_filter = function(entry, ctx)
				if inside_function_args() then
					local kind = entry:get_kind()
					return kind == cmp.lsp.CompletionItemKind.Variable
				end
				return true
			end,
		},
		{ name = "luasnip", max_item_count = 16 },
		{ name = "path",    max_item_count = 16 },
		{ name = "buffer",  max_item_count = 16 },
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
			-- col_offset = -3,
			-- side_padding = 0,

			col_offset = 0,
			side_padding = 1,
			max_width = 60, -- Largura máxima do menu de conclusão
			max_height = 15, -- Altura máxima do menu de conclusão
		}),
		documentation = cmp.config.window.bordered({
			winhighlight = "Normal:normal,FloatBorder:normal,Search:None",
			-- col_offset = -3,
			-- side_padding = 0,

			col_offset = 0,
			side_padding = 1,
			max_width = 60, -- Largura máxima do menu de conclusão
			max_height = 15, -- Altura máxima do menu de conclusão
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
		comparators = {
			cmp.config.compare.exact,
			cmp.config.compare.recently_used,
			cmp.config.compare.score,
		},
	},
	-- enabled = is_activated(),
}
