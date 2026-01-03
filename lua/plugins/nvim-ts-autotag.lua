return {
	"windwp/nvim-ts-autotag",
	lazy = false,
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {
		opts = {
			enable_close = true,
			enable_rename = true,
			enable_close_on_slash = true,
		},
	},
}
