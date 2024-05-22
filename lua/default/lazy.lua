local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- show lines
  "lukas-reineke/indent-blankline.nvim",

  -- close keys
   'jiangmiao/auto-pairs',

  -- build code
   'CRAG666/code_runner.nvim',

  -- mini terminal
   'CRAG666/betterTerm.nvim',

  -- theme
   { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ... },
   {
   "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
   },


  -- navegator
   {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- icons
    },
  },

  -- search code
   {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },


  -- show signature args
   'ray-x/lsp_signature.nvim',

  -- syntax highlight
   {
    'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'
  },

  -- nãosei
  --  'nvim-treesitter/playground'

  -- lsp
   {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
    }
  },

  -- Autocompletion
   {
    'hrsh7th/nvim-cmp',
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'},
      'hrsh7th/cmp-calc',
    }
  },

  -- Snippet
  {
	  "L3MON4D3/LuaSnip",
	  -- follow latest release.
	  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	  -- install jsregexp (optional!).
	  build = "make install_jsregexp",
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim'
    }
  }
})
