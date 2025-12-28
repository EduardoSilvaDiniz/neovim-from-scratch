return {
	"stevearc/conform.nvim",
	opts = require("config.conform"),
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true })
			end,
			desc = "Formata buffer",
		},
	},
}
