return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	lazy = true,
	opts = {},
	dependencies = {
		"echasnovski/mini.icons",
	},
	keys = {
		{
			"<leader>c",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "[C]ode",
		},
		{
			"<leader>d",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "[D]ocument",
		},
		{
			"<leader>r",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "[R]ename",
		},
		{
			"<leader>s",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "[S]earch",
		},
		{
			"<leader>w",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "[W]orkspace",
		},
		{
			"<leader>t",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "[T]oggle",
		},
		{
			"<leader>h",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Git [H]unk",
		},
		{
			"<leader>b",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "[B]uffer",
		},
		{
			"<leader>m",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "[M]oviment",
		},
		{
			"<leader>q",
			function()
				require("which-key").show({ global = true })
			end,
			desc = "[Q]uiting",
		},
	},
}
