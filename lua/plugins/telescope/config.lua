pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")
local telescope = require("telescope")
local actions = require("telescope.actions")
local open_with_trouble = require("trouble.sources.telescope").open
local add_to_trouble = require("trouble.sources.telescope").add

telescope.setup({
	defaults = {
		mappings = {
			i = { ["<C-t>"] = open_with_trouble },
			n = { ["<C-t>"] = open_with_trouble },
		},
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		pickers = {
			find_files = {
				theme = "ivy",
			},
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_ivy(),
		},
	},
})
