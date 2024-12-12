local cmp = require("cmp")
local lspkind = require('lspkind')

cmp.setup({
	mapping = require("plugins.cmp.keymap").setup(cmp),

	completion = {
		winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None,CursorLine:MyCursorLine",
		side_padding = 0,
	},

	window = {
		completion = {
			winhighlight = "Normal:Normal,FloatBorder:CmpCompletionBorder,CursorLine:Pmenu",
			border = "rounded",
			scrollbar = false,
			col_offset = -3,
			side_padding = 0,
		},
		documentation = {
			scrollbar = false,
			winhighlight = "Normal:Normal,FloatBorder:CmpCompletionBorder",
			border = "rounded",
		},
		snippet = {
			winhighlight = "Normal:Normal,FloatBorder:CmpCompletionBorder",
			border = "rounded",
		},
	},

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = lspkind.cmp_format(),
	},

	sources = {
		{ name = "luasnip", max_item_count = 10 },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua", keyword_length = 2 },
		{ name = "buffer", keyword_length = 3 },
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

	completeopt = "menu,menuone,noinsert",

	cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done()),

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
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})
