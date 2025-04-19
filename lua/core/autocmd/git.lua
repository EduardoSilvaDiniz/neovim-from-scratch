
vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "enable keymap to manager git repository",
	pattern = "*",
	callback = function()
		if require("lib.utils").is_git_repo() then
			local keymaps = require("plugins.lazygit.keymap")
			local loadkeys = require("lib.loadkeys")
			loadkeys.manual_load(keymaps, "lazygit")
		end
	end,
})
