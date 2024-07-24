return {
	"CRAG666/betterTerm.nvim",
	opts = {
		position = "bot",
		size = 15,
	},
	keys = {
		{
			"<C-;>",
			function()
				require("betterTerm").open()
			end,
			desc = "Open terminal",
			mode = { "n", "t" },
		},
	},
}
