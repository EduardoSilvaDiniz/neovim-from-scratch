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

return {
	{ "<leader><leader>", searchinOpenFiles(), desc = "/ in Open Files" },
	{ "<leader>sn", searchinOpenFiles(), desc = "Neovim files" },
	{ "<leader>sh", builtin.help_tags, desc = "Help" },
	{ "<leader>sk", builtin.keymaps, desc = "Keymaps" },
	{ "<leader>sp", builtin.find_files, desc = "Project" },
	{ "<leader>ss", builtin.builtin, desc = "Select Telescope" },
	{ "<leader>sw", builtin.grep_string, desc = "Word" },
	{ "<leader>sg", builtin.live_grep, desc = "Grep" },
	{ "<leader>sd", builtin.diagnostics, desc = "Diagnostics" },
	{ "<leader>sr", builtin.resume, desc = "Resume" },
	{ "<leader>s.", builtin.oldfiles, desc = 'Recent Files ("." for repeat)' },
	{ "<leader>bb", builtin.buffers, desc = "Buffer" },
}
