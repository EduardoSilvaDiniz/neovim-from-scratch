local M = {}

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

M.setup = function()
	local lspkind = require("lspkind")
	local cmp = require("cmp")
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	local cmp_functions = require("lib.cmp_functions")
	local luasnip = require("luasnip")

	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

---@diagnostic disable-next-line: undefined-field
	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = { name = "buffer", max_item_count = 16 },
	})

---@diagnostic disable-next-line: undefined-field
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path",    max_item_count = 16 },
			{ name = "cmdline", max_item_count = 16 },
		}),
		matching = { disallow_symbol_nonprefix_matching = false },
	})

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
			{ name = "nvim_lsp", max_item_count = 16 },
			{ name = "luasnip",  max_item_count = 16 },
			{ name = "path",     max_item_count = 16 },
			{ name = "buffer", max_item_count = 16 },
		},

		preselect = {
			cmp.PreselectMode.None,
		},

		formatting = {
			format = lspkind.cmp_format({
				maxwidth = 50,
				ellipsis_char = "...",
			}),
		},

		window = {
			completion = cmp.config.window.bordered({
				winhighlight = "Normal:normal,FloatBorder:normal,Search:None",
				col_offset = -3,
				side_padding = 0,
			}),
			documentation = cmp.config.window.bordered({
				winhighlight = "Normal:normal,FloatBorder:normal,Search:None",
				col_offset = -3,
				side_padding = 0,
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
end

return M
