return {
	{
		"mason-org/mason.nvim",
		dependencies = "neovim/nvim-lspconfig",
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = {
			ensure_installed = {
				    'lua-language-server',
						'vtsls',
						'vue-language-server',
						'tailwindcss-language-server',
						'emmet-language-server',
						"prettierd",
						"stylua",
						"intelephense",
						"laravel-ls",
						"phpactor",
			},
			integrations = {
    		['mason-lspconfig'] = true,
    		['mason-null-ls'] = false,
    		['mason-nvim-dap'] = false,
  		},
		},
	},
}
