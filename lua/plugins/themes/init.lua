local themes = {
	gruvbox = {
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gruvbox")

			local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
			vim.api.nvim_set_hl(0, "GruvboxRedSign", { fg = "#fb4934", bg = normal_bg })
			vim.api.nvim_set_hl(0, "GruvboxAquaSign", { fg = "#8ec07c", bg = normal_bg })
			vim.api.nvim_set_hl(0, "GruvboxBlueSign", { fg = "#83a598", bg = normal_bg })
			vim.api.nvim_set_hl(0, "GruvboxYellowSign", { fg = "#fabd2f", bg = normal_bg })
		end,
	},
	everforest = {
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("everforest")

			local normal = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
			vim.api.nvim_set_hl(0, "FloatBorder", { fg = normal, bg = normal })
			vim.api.nvim_set_hl(0, "NormalFloat", { fg = normal, bg = normal })
		end,
	}
}

return themes["gruvbox"]
