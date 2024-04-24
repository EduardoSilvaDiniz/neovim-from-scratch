--vim.opt.completeopt=menuone,noselect,noinsert,popup
---- Remova a opção 'preview' de completeopt
vim.o.completeopt = vim.o.completeopt:gsub(',preview', '')
vim.opt.nu = true
vim.opt.number = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.cmd('colorscheme gruvbox')
