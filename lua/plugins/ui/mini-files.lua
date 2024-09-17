return {
	"echasnovski/mini.files",
	version = "*",
	keys = {
		{ "<leader>e", "<cmd>lua MiniFiles.open()<cr>", desc = "Open Mini.files" },
	},
	config = function()
		require("mini.files").setup()
	end,
}
