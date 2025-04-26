---@diagnostic disable: undefined-field
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			config = function()
				vim.notify = require("notify")
				require("notify").setup({
					render = "wrapped-compact",
					stages = "static",
				})
			end,
		},
	},
	opts = require("plugins.noice.config"),
}
