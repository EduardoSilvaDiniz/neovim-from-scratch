local conform = require("conform")

return {
	{
		"<leader>f",
		function()
			conform.format({ async = true })
		end,
		{ desc = "formata buffer" },
	},
	{ "<leader>l3", "<cmd>ConformInfo<cr>", { desc = "Conform" } },
}
