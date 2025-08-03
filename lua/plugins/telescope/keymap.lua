pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")
local builtin = require("telescope.builtin")

return {
	{ "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" } },
	{ "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" } },
	{ "<leader>sf", builtin.find_files, { desc = "arquivos" } },
	{ "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" } },
	{ "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" } },
	{ "<leader>sg", builtin.live_grep, { desc = "pesquisa com grep" } },
	{ "<leader>sd", builtin.diagnostics, { desc = "pesquisa diagnosticos" } },
	{ "<leader>r", builtin.resume, { desc = "ultima pesquisa" } },
	{ "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' } },
	{ "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" } },
}
