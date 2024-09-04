return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	keys = function()
		local harpoon = require("harpoon")

		return {
			{
				"<leader>hd",
				function()
					harpoon:list():add()
				end,
				desc = "a[D]d mark",
			},

			{
				"<leader>hs",
				function()
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "[S]earch quick menu",
			},

			{
				"<A-1>",
				function()
					harpoon:list():select(1)
				end,
				desc = "select 1",
			},

			{
				"<A-2>",
				function()
					harpoon:list():select(2)
				end,
				desc = "select 2",
			},

			{
				"<A-3>",
				function()
					harpoon:list():select(3)
				end,
				desc = "select 3",
			},

			{
				"<A-4>",
				function()
					harpoon:list():select(4)
				end,
				desc = "select 4",
			},

			{
				"<leader>ha",
				function()
					harpoon:list():prev()
				end,
				desc = "prov select",
			},
			{
				"<leader>hl",
				function()
					harpoon:list():next()
				end,
				desc = "next select",
			},
		}
	end,
}
