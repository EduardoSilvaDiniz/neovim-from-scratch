local builtin = require("telescope.builtin")

local function builtinFindFilesConfig()
	return function()
		builtin.find_files({ cwd = vim.fn.stdpath("config") })
	end
end

local function searchinOpenFiles()
	return function()
		builtin.live_grep({ grep_open_files = true, prompt_title = "Live Grep in Open Files" })
	end
end

local keymap = vim.keymap
keymap.set("n", "<leader>sb", builtin.current_buffer_fuzzy_find, { desc = "Search buffer" })
keymap.set("n", "<leader>ss", builtin.current_buffer_fuzzy_find, { desc = "Search buffer" })
keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search all open buffers" })
-- keymap.set("n", "<leader><leader>", searchinOpenFiles(), { desc = "Find file in project" })
keymap.set("n", "<leader>se", searchinOpenFiles(), { desc = "Search config.nvim" })
-- keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Word" })
keymap.set("n", "<leader>r", builtin.resume, { desc = "Resume telescope" })
-- keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "Recent Files ('.' for repeat)" })
keymap.set('n', '<leader>sj',"<cmd>Telescope bookmarks<cr>", { desc = 'Jump list'})
