return {
	"gbprod/phpactor.nvim",
	ft = "php",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"neovim/nvim-lspconfig",
		-- If the update/install notification doesn't show properly,
		-- you should also add here UI plugins like "folke/noice.nvim" or "stevearc/dressing.nvim"
	},
	keys = {
		{
			"<leader>pm",
			function()
				require("phpactor").rpc("context_menu", {})
			end,
			desc = "Phpactor context menu",
		},
	},
	opts = {
		install = {
			path = vim.fn.stdpath("data") .. "/mason/packages/phpactor/",
			branch = "master",
			bin = vim.fn.stdpath("data") .. "/mason/packages/phpactor/phpactor.phar",
			php_bin = "php",
			composer_bin = "composer",
			git_bin = "git",
			check_on_startup = "none",
		},
		lspconfig = {
			enabled = false,
			options = {},
		},
	},
}
