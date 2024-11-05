return {
	"rebelot/heirline.nvim",
	dependencies = "Zeioth/heirline-components.nvim",
	config = function()
		local heirline = require("heirline")
		local components = require("heirline-components.all")
		components.init.subscribe_to_events()
		heirline.load_colors(components.hl.get_colors())

		local StatusLine = {
			--#TODO adicionar exibição de macro
			--#TODO melhorar a exibição do modo atual
			--#TODO passa a configuração para o config.lua
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

		require("heirline").setup({
			statusline = StatusLine,
			tabline = TabLine,
		})
	end,
}
