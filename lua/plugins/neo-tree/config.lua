return {
	event_handlers = {
		{
			event = "file_open_requested",
			handler = function()
				require("neo-tree.command").execute({ action = "close" })
			end,
		},
	},
	filesystem = {
		window = {
			mappings = {
				["\\"] = "close_window",
				["l"] = "open",
				["h"] = "back_close_folder",
				["<cr>"] = "refresh",
			},
		},
	},
	commands = {
		back_close_folder = function(state)
			local node = state.tree:get_node()
			if node.type == "directory" and node:is_expanded() then
				state.commands.toggle_node(state)
			else
				require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
			end
		end,
	},
}
