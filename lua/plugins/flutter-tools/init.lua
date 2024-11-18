return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
  ft = "dart",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	"sidlatau/dart-lsp-refactorings.nvim",
	},
	config = function()
		require("flutter-tools").setup({
			dev_log = {
				enabled = false,
			},
			settings = {
				closingLabels = false,
			},
		})
	end,
}
