vim.o.background = "dark"
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.g.have_nerd_font = true
vim.g.editorconfig = true
vim.wo.number = true
vim.lsp.inlay_hint.enable(true)
vim.opt.signcolumn = "yes:1"
vim.lsp.enable({
	"bashls",
	"clangd",
	"gopls",
	-- "jdtls", -- nvim-jdtls plugin controls this lsp
	"lua_ls",
	"nil_ls",
	"rust_analyzer",
	-- "ts_server", -- typescript-tools plugin controls this lsp
	"yamlls",
})

local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
vim.api.nvim_set_hl(0, "FloatBorder", { bg = normal_bg })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = normal_bg })
vim.api.nvim_set_hl(0, "SignColumn", { bg = normal_bg })

vim.keymap.set("n", "<leader>qq", "<cmd>q<cr>", { desc = "sair do neovim" })
vim.keymap.set("n", "<leader>qs", "<cmd>q!<cr>", { desc = "sair do neovim sem salvar" })
