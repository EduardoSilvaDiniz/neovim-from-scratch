return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>e", "<Cmd>Neotree<CR>", desc = "Abrir Neo-tree" },
	},
	opts = {
		-- window = {
		-- 	position = "float",
		-- 	popup = {
		-- 		border = "rounded",
		-- 		title = "Neo-Tree",
		-- 		title_pos = "center",
		-- 	},
		-- },
		event_handlers = {
			{
				event = "file_open_requested",
				handler = function()
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
			{
				event = "file_renamed",
				handler = function(data)
					Snacks.rename.on_rename_file(data.source, data.destination)
				end,
			},
			{
				event = "file_moved",
				handler = function(data)
					Snacks.rename.on_rename_file(data.source, data.destination)
				end,
			},
		},
		default_component_configs = {
			indent = { padding = 1 },
		},
		reveal_current_file = true,
		filesystem = {
			follow_current_file = true,
			use_libuv_file_watcher = true,
			group_empty_dirs = true,
			filtered_items = {
				visible = true,
			},
			window = {
				mappings = {
					["<C-'>"] = "close_window",
					["\\"] = "close_window",
					["l"] = "open",
					["h"] = "back_close_folder",
					["<cr>"] = "refresh",
					["P"] = {
						"toggle_preview",
						config = {
							use_float = true,
							use_image_nvim = true,
							title = "Neo-tree Preview",
						},
					},
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
	},
}
