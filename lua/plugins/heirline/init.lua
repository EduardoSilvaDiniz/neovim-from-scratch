return {
	"rebelot/heirline.nvim",
	dependencies = {
		"Zeioth/heirline-components.nvim",
		"rebelot/kanagawa.nvim",
	},
	config = function()
		local heirline = require("heirline")
		local components = require("heirline-components.all")
		components.init.subscribe_to_events()
		heirline.load_colors(components.hl.get_colors())

		local StatusLine = {
			components.component.mode(),
			components.component.file_info({ filetype = false, filename = {}, file_modified = false }),
			components.component.nav(),

			components.component.fill(),

			components.component.lsp(),
			components.component.diagnostics(),
			components.component.git_branch(),
			components.component.git_diff(),
		}
		local TabLine = {}

		vim.cmd([[colorscheme kanagawa-wave]])
		require("heirline").setup({
			statusline = StatusLine,
			tabline = TabLine,
		})
	end,
}
