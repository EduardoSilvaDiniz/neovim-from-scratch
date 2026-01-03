return {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("gruvbox-material")

		vim.api.nvim_set_hl(0, "NeoTreeNormal", { link = "Normal" })
		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { link = "Normal" })
		vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { link = "Normal" })
		vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = vim.api.nvim_get_hl_by_name("Normal", true).background })
		vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg = CursorLine })
	end,
}
