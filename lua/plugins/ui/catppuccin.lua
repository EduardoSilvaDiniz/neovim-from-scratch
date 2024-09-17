return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {},
	config = function()
		require("catppuccin").setup({
			integrations = {
				cmp = true,
				treesitter = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
		})
		vim.cmd.colorscheme("catppuccin-frappe")
	end,
}
