return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },

				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "location" },
				lualine_z = {
					function()
						return "  " .. os.date("%R")
					end,
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },

				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {
				"aerial",
				"ctrlspace",
				"fern",
				"fugitive",
				"fzf",
				"lazy",
				"man",
				"mason",
				"mundo",
				"neo-tree",
				"nvim-dap-ui",
				"oil",
				"overseer",
				"quickfix",
				"symbols-outline",
				"toggleterm",
				"trouble",
			},
		})
	end,
}
