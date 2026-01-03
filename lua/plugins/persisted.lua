return {
	"olimorris/persisted.nvim",
	event = "BufReadPre", -- Ensure the plugin loads only when a buffer has been loaded
	keys = {
		{ "<leader>pp", "<cmd>Telescope persisted<cr>", desc = "Menu de projetos" },
		{ "<leader>ql", "<cmd>SessionLoadLast<cr>", desc = "Restaurar última sessão" },
	},
	opts = {
		allowed_dirs = {
			"~/Projetos",
		},
	},
}
