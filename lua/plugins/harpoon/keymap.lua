local harpoon = require("harpoon")
for i = 1, 9 do
	vim.keymap.set(
		"n",
		"h" .. i,
		function()
			require("harpoon"):list():select(i)
		end)
end

return {
	{ "ha", function() harpoon:list():add() end,                         { desc = "Harpoon File" } },
	{ "hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon Quick Menu" } },
}
