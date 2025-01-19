return {
	select = {
		backend = { "nui" },
		nui = {
			min_width = 7,
			min_height = 2,
		},
	},
	input = {
		relative = "win",
		mappings = {
			n = {
				["<Esc>"] = "Close",
				["<CR>"] = "Confirm",
			},
			i = {
				["<Esc>"] = "Close",
				["<CR>"] = "Confirm",
				["<Up>"] = "HistoryPrev",
				["<Down>"] = "HistoryNext",
			},
		},
	},
}
