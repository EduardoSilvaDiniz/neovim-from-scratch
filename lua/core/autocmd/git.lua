local function is_git_repo(path)
	path = path or vim.fn.expand("%:p:h")
	while path ~= "/" do
		if vim.fn.isdirectory(path .. "/.git") == 1 then
			return true
		end
		path = vim.fn.fnamemodify(path, ":h")
	end
	return false
end

vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "enable keymap to manager git repository",
	pattern = "*",
	callback = function(event)
		if is_git_repo() then
			local keymaps = require("plugins.lazygit.keymap")
			local loadkeys = require("lib.loadkeys")
			loadkeys.manual_load(keymaps)
		end
	end,
})
