local config = require("plugins.mason.config")
return {
	{
		"mason-org/mason.nvim",
		opts = true,
		config = vim.schedule(function()
			local keymaps = require("plugins.mason.keymap")
			local loadkeys = require("lib.loadkeys")
			loadkeys.manual_load(keymaps, nil)
		end),
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = config.lsp,
		config = function()
			require("mason-lspconfig").setup {
				automatic_enable = false
			}
		end
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = config.dap,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = config.format,
	},
}
