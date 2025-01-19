return {
	cmdline = {
		format = {
			cmdline = { title = "" },
			search_down = { title = "" },
			search_up = { title = "" },
		},
	},

	views = {
		cmdline_popup = {
			position = {
				row = "90%",
				col = "50%",
			},
			size = {
				width = 80,
				height = "auto",
			},
		},
	},

	messages = {
		view = "mini",
		view_search = "mini",
	},

	routes = {
		{
			filter = {
				event = "lsp",
				kind = "progress",
			},
			view = "mini",
		},
		{
			filter = {
				event = "msg_show",
				kind = "confirm",
			},
			view = "confirm",
		},
		{
			filter = {
				event = "msg_show",
				min_height = 2,
			},
			view = "messages",
		},
		{
			filter = {
				event = "msg_show",
				any = {
					{ kind = "echo" },
					{ kind = "bufwrite" },
					{ find = "fewer lines" },
					{ find = "after #" },
					{ find = "before #" },
					{ find = "No lines in buffer" },
					{ find = "Found a swap file" },
					{ find = "Ignoring swapfile" },
				},
			},
			skip = true,
		},
	},

	vim.keymap.set("n", "<leader>N", function()
		require("noice").cmd("history")
	end, { desc = "Open [N]otifications" }),
}
-- reference
-- https://github.com/Hashino/hash.nvim/blob/main/lua/hash/plugins/interface/improved-ui-elements.lua
