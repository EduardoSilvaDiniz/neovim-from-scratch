pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")
local substitute = require("substitute")
local builtin = require("telescope.builtin")
local M = {}

M.plugins = {
	neo_tree = {
		enable = true,
		keymaps = {
			{ "tn", "<cmd>Neotree reveal<cr>", { noremap = true } },
		},
	},
	telescope = {
		enable = true,
		keymaps = {
			{ "<leader>sh",       builtin.help_tags,   { desc = "[S]earch [H]elp" } },
			{ "<leader>sk",       builtin.keymaps,     { desc = "[S]earch [K]eymaps" } },
			{ "<leader>sf",       builtin.find_files,  { desc = "[S]earch [F]iles" } },
			{ "<leader>ss",       builtin.builtin,     { desc = "[S]earch [S]elect Telescope" } },
			{ "<leader>sw",       builtin.grep_string, { desc = "[S]earch current [W]ord" } },
			{ "<leader>sg",       builtin.live_grep,   { desc = "[S]earch by [G]rep" } },
			{ "<leader>sd",       builtin.diagnostics, { desc = "[S]earch [D]iagnostics" } },
			{ "<leader>sr",       builtin.resume,      { desc = "[S]earch [R]esume" } },
			{ "<leader>s.",       builtin.oldfiles,    { desc = '[S]earch Recent Files ("." for repeat)' } },
			{ "<leader><leader>", builtin.buffers,     { desc = "[ ] Find existing buffers" } },
			{
				"<leader>/",
				function()
					builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
						winblend = 10,
						previewer = false,
					}))
				end,
				{ desc = "[/] Fuzzily search in current buffer" },
			},
		},
		{
			"<leader>s/",
			function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end,
			{ desc = "[S]earch [/] in Open Files" },
		},
		{
			"<leader>sn",
			function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end,
			{ desc = "[S]earch [N]eovim files" },
		},
	},
	substitute = {
		enable = true,
		keymaps = {
			{ "s",  substitute.operator, { noremap = true } },
			{ "ss", substitute.line,     { noremap = true } },
			{ "S",  substitute.eol,      { noremap = true } },
			{ "s",  substitute.visual,   { noremap = true }, { "x" } },
		},
	},
}

local map = function(keys, func, opts, mode)
	mode = mode or "n"
	opts.desc = opts.desc or ""
	opts.noremap = opts.noremap or false
	vim.keymap.set(mode, keys, func, { desc = opts.desc, noremap = opts.noremap })
end

function M.load_plugins()
	for _, plugin in pairs(M.plugins) do
		if plugin.enable then
			for _, keymap in ipairs(plugin.keymaps) do
				map(unpack(keymap))
			end
		end
	end
end

return M
