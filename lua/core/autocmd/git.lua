vim.api.nvim_create_autocmd("BufReadPost", {
	group = vim.api.nvim_create_augroup("GitProjectDetection", { clear = true }),
	callback = function(event)
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
		if is_git_repo() then
			require("core.keymaps").manual_load("lazygit")
		end
	end,
})
