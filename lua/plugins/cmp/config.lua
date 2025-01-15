local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_functions = require("lib.cmp_functions")

cmp.setup({
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
			require("luasnip").lsp_expand(args.body)
		end,
	},

	sources = {
		{ name = "luasnip",  max_item_count = 10 },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua", keyword_length = 2 },
		{ name = "buffer",   keyword_length = 3 },
		{ name = "path" },
	},

	preselect = {
		cmp.PreselectMode.None,
	},

	sorting = {
		comparators = {
			cmp.config.compare.exact,
			cmp.config.compare.recently_used,
			cmp.config.compare.score,
		},
	},

	enabled = function()
		local context = require("cmp.config.context")
		local disabled = false
		disabled = disabled or (vim.api.nvim_get_option_value("buftype", {}) == "prompt")
		disabled = disabled or (vim.api.nvim_get_option_value("buftype", {}) == "nofile")
		disabled = disabled or (vim.fn.reg_recording() ~= "")
		disabled = disabled or (vim.fn.reg_executing() ~= "")
		disabled = disabled or context.in_treesitter_capture("comment")
		return not disabled
	end,
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = { name = "buffer" },
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "cmdline" },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})
