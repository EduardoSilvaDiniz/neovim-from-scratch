return {
	"nvimdev/dashboard-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "VimEnter",
	config = function()
		local config = require("plugins.dashboard.config")
		-- local logo = string.rep("\n", 1) .. config.logo .. "\n\n"
		local logo = config.logo 

		require("dashboard").setup({
			theme = "doom",
			hide = { statusline = false },
			config = {
				header = vim.split(logo, "\n"),
				center = {
					{ action = config.findFiles(), desc = " Find File", icon = " ", key = "f" },
					{ action = config.openNewFile(), desc = " New File", icon = " ", key = "n" },
					{ action = config.findRecentFiles(), desc = " Recent File", icon = " ", key = "r" },
					{ action = config.listProjects(), desc = " Project", icon = " ", key = "p" },
					{ action = config.restoreSession(), desc = " Restore Session", icon = " ", key = "s" },
					{ action = config.findConfigFiles(), desc = " config", icon = " ", key = "c" },
					{ action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
					{ action = config.quitVim, desc = " Quit", icon = " ", key = "q" },
				},
				footer = config.configFooter(),
			},
		})
	end,
}
