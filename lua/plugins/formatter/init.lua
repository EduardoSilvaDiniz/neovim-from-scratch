return {
	{
		"stevearc/conform.nvim",
		lazy = false,
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				desc = "[F]ormat buffer",
			},
		},
		config = function()
			require("plugins.formatter.config-conform")
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},

		config = function()
			require("plugins.formatter.config-lint")
		end,
	},
	{
		"nvimdev/indentmini.nvim",
		opts = {},
	},
}
