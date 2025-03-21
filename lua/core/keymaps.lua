pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")
local substitute = require("substitute")
local builtin = require("telescope.builtin")
local refactoring = require("refactoring")
local M = {}

local function check_plugin(plugin)
	plugin = plugin:gsub("_", "-")
	local status, _ = pcall(require, plugin)
	if status then
		return true
	else
		return false
	end
end

local keys_auto = {
	telescope = {
		{ "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" } },
		{ "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" } },
		{ "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" } },
		{ "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" } },
		{ "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" } },
		{ "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" } },
		{ "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" } },
		{ "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" } },
		{ "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' } },
		{ "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" } },
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
		{ "s", substitute.operator, { noremap = true } },
		{ "ss", substitute.line, { noremap = true } },
		{ "S", substitute.eol, { noremap = true } },
		{ "s", substitute.visual, { noremap = true }, { "x" } },
	},
	refactoring = {
		{ "<leader>re",  "<cmd>Refactor extract<cr>", {desc = "extract"}, "x" },
		{ "<leader>rf",  "<cmd>Refactor extract_to_file<cr>", {desc = "extract to file"},"x" },
		{ "<leader>rv",  "<cmd>Refactor extract_var<cr>", {desc = "extract var"},"x" },
		{ "<leader>ri",  "<cmd>Refactor inline_var<cr>", {desc = "inline var"},{ "n", "x" } },
		{ "<leader>rI",  "<cmd>Refactor inline_func<cr>", {desc = "inline_func"}},
		{ "<leader>rb",  "<cmd>Refactor extract_block<cr>", {desc = "extract_block"} },
		{ "<leader>rbf", "<cmd>Refactor extract_block_to_file<cr>", {desc = "extract_block_to_file"}},
	},
}

local keys_manual = {
	lspconfig = {
		{ "gd", builtin.lsp_definitions, { desc = "[G]oto [D]efinition" } },
		{ "gr", builtin.lsp_references, { desc = "[G]oto [R]eferences" } },
		{ "gI", builtin.lsp_implementations, { desc = "[G]oto [I]mplementation" } },
		{ "<leader>D", builtin.lsp_type_definitions, { desc = "Type [D]efinition" } },
		{ "<leader>ds", builtin.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" } },
		{ "<leader>ws", builtin.lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" } },
		{ "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" } },
		{ "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" }, { "n", "x" } },
		{ "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" } },
		{ "<leader>f", vim.lsp.buf.format, { desc = "Format buffer " } },
	},

	lazygit = {
		{ "gl", "<cmd>LazyGit<cr>", { noremap = true } },
	},
}

local map = function(keys, func, opts, mode)
	mode = mode or "n"
	opts.desc = opts.desc or ""
	opts.noremap = opts.noremap or false
	vim.keymap.set(mode, keys, func, { desc = opts.desc, noremap = opts.noremap })
end

function M.autoload()
	for name, keymaps in pairs(keys_auto) do
		if check_plugin(name) then
			for _, keymap in ipairs(keymaps) do
				map(unpack(keymap))
			end
		end
	end
end

function M.manual_load(plugin)
	if check_plugin(plugin) then
		for _, keymap in ipairs(keys_manual[plugin]) do
			map(unpack(keymap))
		end
	end
end

return M
