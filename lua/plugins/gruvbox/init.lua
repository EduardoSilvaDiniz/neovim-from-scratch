return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			overrides = {
				SignColumn = { bg = "#282828" },
				DiagnosticSignError = { bg = "#282828", fg = "#fb4934" },
				DiagnosticSignOk = { bg = "#282828", fg = "#fb4934" },
				DiagnosticSignHint = { bg = "#282828", fg = "#8ec07c" },
				DiagnosticSignInfo = { bg = "#282828", fg = "#83a598" },
				DiagnosticSignWarn = { bg = "#282828", fg = "#fabd2f" },
			},
		})
		vim.o.background = "dark"
		vim.cmd([[colorscheme gruvbox]])
	end,
}
