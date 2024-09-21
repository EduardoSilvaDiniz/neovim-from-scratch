pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")
local telescope = require("telescope")

telescope.setup({
	defaults = {
		borderchars = {
			prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
			results = { " " },
			preview = { " " },
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
	},
})
