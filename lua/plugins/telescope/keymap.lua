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
	{ "<leader><leader>", searchinOpenFiles(), desc = "[S]earch [/] in Open Files" },
	{ "<leader>sn", searchinOpenFiles(), desc = "[S]earch [N]eovim files" },
	{ "<leader>sh", builtin.help_tags, desc = "[S]earch [H]elp" },
	{ "<leader>sk", builtin.keymaps, desc = "[S]earch [K]eymaps" },
	{ "<leader>sf", builtin.find_files, desc = "[S]earch [F]iles" },
	{ "<leader>ss", builtin.builtin, desc = "[S]earch [S]elect Telescope" },
	{ "<leader>sw", builtin.grep_string, desc = "[S]earch current [W]ord" },
	{ "<leader>sg", builtin.live_grep, desc = "[S]earch by [G]rep" },
	{ "<leader>sd", builtin.diagnostics, desc = "[S]earch [D]iagnostics" },
	{ "<leader>sr", builtin.resume, desc = "[S]earch [R]esume" },
	{ "<leader>s.", builtin.oldfiles, desc = '[S]earch Recent Files ("." for repeat)' },
	{ "<leader>sb", builtin.buffers, desc = "[ ] Find existing buffers" },
}
