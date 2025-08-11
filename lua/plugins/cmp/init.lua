---@diagnostic disable: undefined-field, redundant-parameter
if true then
	return {}
end
return {
	"hrsh7th/nvim-cmp",
	version = false,
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"nvim-tree/nvim-web-devicons",
		"onsails/lspkind.nvim",
		"nvim-lua/plenary.nvim",
		"saghen/blink.cmp",
	},
	config = function()
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		local cmp_config = require("plugins.cmp.config")

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer", max_item_count = 8 },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "path", max_item_count = 8 },
				{ name = "cmdline", max_item_count = 8 },
			},
			matching = { disallow_symbol_nonprefix_matching = false },
		})

		cmp.setup(cmp_config)
	end,
}
