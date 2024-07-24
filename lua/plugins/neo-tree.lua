-- Desativar o netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "NeoTree reveal", silent = true } },
		{ "<CR>", nil },
	},
	opts = {
		commands = {
			parent_or_close = function(state)
				local node = state.tree:get_node()
				if (node.type == "directory" or node:has_children()) and node:is_expanded() then
					state.commands.toggle_node(state)
				else
					require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
				end
			end,
			child_or_open = function(state)
				local node = state.tree:get_node()
				if node.type == "directory" or node:has_children() then
					if not node:is_expanded() then -- if unexpanded, expand
						state.commands.toggle_node(state)
					else -- if expanded and has children, seleect the next child
						require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
					end
				else -- if not a directory just open it
					state.commands.open(state)
				end
			end,
		},
		event_handlers = {
			{
				event = "file_open_requested",
				handler = function()
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		},
		filesystem = {
			group_empty_dirs = true, -- when true, empty folders will be grouped together
			window = {
				mappings = {
					l = "child_or_open",
					h = "parent_or_close",
					["<CR>"] = nil,
				},
			},
		},
	},
}
