return {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("gruvbox-material")

		local group_color_normal = vim.api.nvim_get_hl(0, { name = "Normal" })
		vim.api.nvim_set_hl(0, "NeoTreeNormal", { link = "Normal" })
		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { link = "Normal" })
		vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { link = "Normal" })
		vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = group_color_normal.bg })

		vim.api.nvim_set_hl(0, "BlinkCmpMenu", { fg = group_color_normal.fg })
		vim.api.nvim_set_hl(0, "BlinkCmpmenuBorder", { fg = group_color_normal.fg })
		vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "#3c3836" })
		vim.api.nvim_set_hl(0, "BlinkCmpLabel", { fg = group_color_normal.fg })
		vim.api.nvim_set_hl(0, "BlinkCmpLabelDeprecated", { fg = group_color_normal.fg })
		vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { fg = group_color_normal.fg })
		vim.api.nvim_set_hl(0, "BlinkCmpLabelDetail", { fg = group_color_normal.fg })
		vim.api.nvim_set_hl(0, "BlinkCmpLabelDescription", { fg = group_color_normal.fg })

		vim.api.nvim_set_hl(0, "BlinkCmpKind", { fg = group_color_normal.fg })
		vim.api.nvim_set_hl(0, "BlinkCmpSource", { fg = group_color_normal.fg })
		vim.api.nvim_set_hl(0, "BlinkCmpDoc", { fg = group_color_normal.fg })
		vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = group_color_normal.fg })

		vim.api.nvim_set_hl(0, "LineNr", { fg = group_color_normal.fg })

		vim.api.nvim_set_hl(0, "BlinkCmpItemKindFunction", { fg = "#FB4934" })

		local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = normal_bg })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = normal_bg })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = normal_bg })

		vim.api.nvim_set_hl(0, "WhichKeyTitle", { bg = normal_bg })
	end,
}
