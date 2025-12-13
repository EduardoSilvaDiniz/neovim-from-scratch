vim.o.background = "dark"
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.g.have_nerd_font = true
vim.g.editorconfig = true
vim.wo.number = true
vim.lsp.inlay_hint.enable(true)
vim.g.loaded_node_provider = 1
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.opt.signcolumn = "yes:1"
vim.lsp.enable({
	"clangd",
	"gopls",
	"lua_ls",
	"nil_ls",
	"sqls",
	"pyright",
	"html",
	"cssls",
	"angularls",
	"tailwindcss",
	"intelephense",
	"phpactor",
	"laravel_ls",
	"stimulus_ls",
	"vtsls",
})

local function safe_quit(force)
	local buffers = vim.fn.getbufinfo({ buflisted = 1 })

	if #buffers > 1 then
		vim.cmd(force and "bdelete!" or "bdelete")
	else
		vim.cmd("enew")
		vim.cmd("file [No Name]")
		vim.cmd("bdelete!")
	end
end

local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
vim.api.nvim_set_hl(0, "FloatBorder", { bg = normal_bg })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = normal_bg })
vim.api.nvim_set_hl(0, "SignColumn", { bg = normal_bg })

vim.keymap.set("n", "<leader>Q", "<cmd>exit<cr>", { desc = "fechar neovim" })

vim.keymap.set("n", "<leader><tab>", "gcc", { desc = "sargas/ux: toggle comment", remap = true })
vim.keymap.set("v", "<leader><tab>", "gc", { desc = "sargas/ux: toggle comment", remap = true })

vim.keymap.set("n", "<leader>qq", function()
	safe_quit(false)
end, { desc = "Fechar buffer" })
vim.keymap.set("n", "<leader>qs", function()
	safe_quit(true)
end, { desc = "Fechar buffer sem salvar" })

vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set("n", "<C-f>", "/")
vim.keymap.set("n", "<C-F>", "?")
vim.keymap.set("n", "<leader>oz", "<cmd>Lazy<cr>")

vim.keymap.set("n", "<leader>ol", "<cmd>LspInfo<cr>", { desc = "Lsp" })
vim.keymap.set("n", "<leader>l2", "<cmd>LspLog<cr>", { desc = "Lsp" })
