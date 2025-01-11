local builtin = require("telescope.builtin")
local M = {}

M.plugins = {
	lspconfig = {
		{ "gd",         builtin.lsp_definitions,               { desc = "[G]oto [D]efinition" } },
		{ "gr",         builtin.lsp_references,                { desc = "[G]oto [R]eferences" } },
		{ "gI",         builtin.lsp_implementations,           { desc = "[G]oto [I]mplementation" } },
		{ "<leader>D",  builtin.lsp_type_definitions,          { desc = "Type [D]efinition" } },
		{ "<leader>ds", builtin.lsp_document_symbols,          { desc = "[D]ocument [S]ymbols" } },
		{ "<leader>ws", builtin.lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" } },
		{ "<leader>rn", vim.lsp.buf.rename,                    { desc = "[R]e[n]ame" } },
		{ "<leader>ca", vim.lsp.buf.code_action,               { desc = "[C]ode [A]ction" },        { "n", "x" } },
		{ "gD",         vim.lsp.buf.declaration,               { desc = "[G]oto [D]eclaration" } },
	},
	none_ls = {
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

function M.load_plugins(plugin)
	if M.plugins[plugin] then
		for _, keymap in ipairs(M.plugins[plugin]) do
			map(unpack(keymap))
		end
	else
		vim.notify("Plugin " .. plugin .. " não encontrado ou desativado", vim.log.levels.WARN)
	end
end

return M
