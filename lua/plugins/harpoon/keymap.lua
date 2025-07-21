local harpoonUi = require("harpoon.ui")
local harpoonMark = require("harpoon.mark")

return {
	{ "<leader>ma", harpoonMark.add_file, { desc = "Harpoon File" } },
	{ "<leader>mm", harpoonUi.toggle_quick_menu, { desc = "Harpoon Quick Menu" } },
	{
		"<A-1>",
		function()
			harpoonUi.nav_file(1)
		end,
		{ noremap = true },
	},
	{
		"<A-2>",
		function()
			harpoonUi.nav_file(2)
		end,
		{ noremap = true },
	},
	{
		"<A-3>",
		function()
			harpoonUi.nav_file(3)
		end,
		{ noremap = true },
	},
	{
		"<A-4>",
		function()
			harpoonUi.nav_file(4)
		end,
		{ noremap = true },
	},
	{
		"<A-5>",
		function()
			harpoonUi.nav_file(5)
		end,
		{ noremap = true },
	},
	{
		"<A-6>",
		function()
			harpoonUi.nav_file(6)
		end,
		{ noremap = true },
	},
}
