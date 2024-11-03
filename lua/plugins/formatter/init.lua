return {
	{
		"stevearc/conform.nvim",
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
}
