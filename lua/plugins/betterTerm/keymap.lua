return {
	{
		"<c-]>",
		function()
			require("betterTerm").open()
		end,
		desc = "Open terminal",
		mode = { "n", "t" },
	},
}
