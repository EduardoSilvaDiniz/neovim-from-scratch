local harpoon = require("harpoon")
for i = 1, 9 do
	vim.keymap.set("n", "<leader>h" .. i, function()
		require("harpoon"):list():select(i)
	end, { noremap = true })
end

return {
	{
		"<leader>ha",
		function()
			harpoon:list():add()
		end,
		{ desc = "Harpoon File" },
	},
	{
		"<leader>hm",
		function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end,
		{ desc = "Harpoon Quick Menu" },
	},
}
