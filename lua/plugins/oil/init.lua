return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>o-", "<CMD>Oil --float<CR>", desc = "Oil" },
	},
	---@module 'oil'
	---@type oil.SetupOpts
	config = function()
		require("plugins.oil.config")
	end,
}
