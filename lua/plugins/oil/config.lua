require("oil").setup({
	keymaps = {
		["h"] = "actions.parent",
		["l"] = "actions.select",
		["="] = function()
			vim.cmd(":w")
		end,
		["q"] = "actions.close",
	},
})
