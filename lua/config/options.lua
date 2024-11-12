local signs = { Error = "»", Warn = "»", Hint = "»", Info = "»" }
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = signs.Error,
			[vim.diagnostic.severity.WARN] = signs.Warn,
			[vim.diagnostic.severity.HINT] = signs.Hint,
			[vim.diagnostic.severity.INFO] = signs.Info,
		},
	},
	float = { border = "rounded" },
})

--vim.cmd.colorscheme("catppuccin")
vim.lsp.inlay_hint.enable(true)
vim.opt.showmode = false
vim.o.cmdheight = 0
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.syntax = true
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = true
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- req cmp
vim.g.completeopt = "menu,menuone,popup,fuzzy"

-- limit show autocompletes
vim.opt.pumheight = 15
