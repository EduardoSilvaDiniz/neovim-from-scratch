local cmp = require("cmp")
local function enabled()
	local context = require("cmp.config.context")
	local disabled = false
	disabled = disabled or (vim.api.nvim_get_option_value("buftype", {}) == "prompt")
	disabled = disabled or (vim.api.nvim_get_option_value("buftype", {}) == "nofile")
	disabled = disabled or (vim.fn.reg_recording() ~= "")
	disabled = disabled or (vim.fn.reg_executing() ~= "")
	disabled = disabled or context.in_treesitter_capture("comment")
	return not disabled
end

cmp.setup({
	mapping = require("custom-new.keymap").setup(cmp),

	completion = {
		winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None,CursorLine:MyCursorLine",
		side_padding = 0,
	},

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local icons = require("consts.icons")

			vim_item.kind = icons[vim_item.kind] or ""
			vim_item.menu = " (" .. vim_item.kind .. ") "

			vim_item.menu = ({
				nvim_lsp = "(LSP)",
				nvim_lua = "(Neovim Lua)",
				luasnip = "(LuaSnip)",
				buffer = "(Buffer)",
				path = "(Path)",
			})[entry.source.name]

			return vim_item
		end,
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua", keyword_length = 2 },
		{ name = "luasnip", max_item_count = 10 },
		{ name = "buffer", keyword_length = 3 },
		{ name = "path" },
	},

	preselect = {
		cmp.PreselectMode.None,
	},

	comparators = {
		cmp.config.compare.exact,
		cmp.config.compare.recently_used,
		cmp.config.compare.score,
	},

	completeopt = "menu,menuone,noinsert",

	cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done()),

	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	}),

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
		matching = { disallow_symbol_nonprefix_matching = false },
	}),

	enabled = enabled(),
})
