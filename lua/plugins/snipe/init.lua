return {
  "leath-dub/snipe.nvim",
  opts = require("plugins.snipe.config"),
	config = vim.schedule(function()
		local keymaps = require("plugins.snipe.keymap")
		local loadkeys = require("lib.loadkeys")
		loadkeys.manual_load(keymaps, nil)
	end),
}
