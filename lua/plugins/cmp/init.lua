return {
	"hrsh7th/nvim-cmp",
	version = false,
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"nvim-tree/nvim-web-devicons",
		"onsails/lspkind.nvim",
		"nvim-lua/plenary.nvim",
	},
	opts = require("plugins.cmp.config").setup,
}
