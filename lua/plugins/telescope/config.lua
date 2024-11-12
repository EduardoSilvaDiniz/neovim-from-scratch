pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

local actions = require("telescope.actions")
local telescope = require("telescope")

telescope.setup({
	defaults = {
		mappings = {
			i = { ["<esc>"] = actions.close },
		},
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		highlight = { enable = true },
		indent = { enable = true },
		extensions = {
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		},
	},
})
