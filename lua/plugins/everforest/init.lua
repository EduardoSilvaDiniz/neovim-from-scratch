return {
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000,
	config = function()
		-- vim.api.nvim_set_hl(0, "FloatBorder", {fg = normal, bg = normal})
		-- vim.api.nvim_set_hl(0, "NormalFloat", {fg = normal, bg = normal})
		vim.cmd.colorscheme("everforest")
	end,
}
