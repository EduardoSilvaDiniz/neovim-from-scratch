return {
	"neovim/nvim-lspconfig",
	cmd = { "LspInfo", "LspInstall", "LspStart" },
	event = { "BufReadPre", "BufNewFile" },
	opts = { inlay_hints = { enable = true } },
	config = function()
		require("plugins.lspconfig.config").setup()

		vim.schedule(function()
			local keymaps = require("plugins.lspconfig.keymap")
			local loadkeys = require("lib.loadkeys")
			loadkeys.manual_load(keymaps)
		end)
	end,
}
