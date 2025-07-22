local harpoon = require("harpoon")
for i = 1, 6 do
	vim.keymap.set(
		"n",
		"<A-" .. i .. ">",
		function()
			require("harpoon"):list():select(i)
		end,
		{ noremap = true, silent = true }
	)
end

return {
	{ "<leader>ma", function() harpoon:list():add() end,                         { desc = "Harpoon File" } },
	{ "<leader>mm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon Quick Menu" } },

	-- {
	-- 	"<A-1>",
	-- 	function()
	-- 		harpoon:list():select(1)
	-- 	end,
	-- 	{ noremap = true },
	-- },
	-- {
	-- 	"<A-2>",
	-- 	function()
	-- 		harpoon:list():select(2)
	-- 	end,
	-- 	{ noremap = true },
	-- },
	-- {
	-- 	"<A-3>",
	-- 	function()
	-- 		harpoon:list():select(3)
	-- 	end,
	-- 	{ noremap = true },
	-- },
	-- {
	-- 	"<A-4>",
	-- 	function()
	-- 		harpoon:list():select(4)
	-- 	end,
	-- 	{ noremap = true },
	-- },
	-- {
	-- 	"<A-5>",
	-- 	function()
	-- 		harpoon:list():select(5)
	-- 	end,
	-- 	{ noremap = true },
	-- },
	-- {
	-- 	"<A-6>",
	-- 	function()
	-- 		harpoon:list():select(6)
	-- 	end,
	-- 	{ noremap = true },
	-- },
}
