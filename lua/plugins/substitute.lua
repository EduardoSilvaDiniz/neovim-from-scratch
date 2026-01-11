return {
	"gbprod/substitute.nvim",
	keys = {
		{
			"s",
			function()
				require("substitute").operator()
			end,
			mode = "n",
		},
		{
			"ss",
			function()
				require("substitute").line()
			end,
			mode = "n",
		},
		{
			"S",
			function()
				require("substitute").eol()
			end,
			mode = "n",
		},
		{
			"s",
			function()
				require("substitute").visual()
			end,
			mode = "x",
		},
	},
	opts = {},
}
