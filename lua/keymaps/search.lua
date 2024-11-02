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
keymap.set("n", "<leader><leader>", searchinOpenFiles(), { desc = "/ in Open Files" })
keymap.set("n", "<leader>sn", searchinOpenFiles(), { desc = "Neovim files" })
keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Help" })
keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Keymaps" })
keymap.set("n", "<leader>sp", builtin.find_files, { desc = "Project" })
keymap.set("n", "<leader>ss", builtin.builtin, { desc = "Select Telescope" })
keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Word" })
keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Grep" })
keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Diagnostics" })
keymap.set("n", "<leader>sr", builtin.resume, { desc = "Resume" })
keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "Recent Files ('.' for repeat)" })
keymap.set("n", "<leader>bb", builtin.buffers, { desc = "Buffer" })
