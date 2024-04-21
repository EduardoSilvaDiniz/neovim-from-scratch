vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- show lines
  use "lukas-reineke/indent-blankline.nvim"

  -- plugin manager
  use 'wbthomason/packer.nvim'

  -- close keys
  use 'jiangmiao/auto-pairs'

  -- run code
  use 'CRAG666/code_runner.nvim'

  -- mini terminal
  use 'CRAG666/betterTerm.nvim'

  -- navegator 
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  -- theme
  use {
    'morhetz/gruvbox',
    gv = 'gruvbox',
    config = function()
      vim.cmd('colorscheme gruvbox')
    end
  }

  -- search code
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- syntax highlight
  use {
    'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'
  }

  -- nãosei
  use 'nvim-treesitter/playground'

  -- lsp
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'honza/vim-snippets'},
      {'neovim/nvim-lspconfig'},
      {'dcampos/nvim-snippy'},
      {'dcampos/cmp-snippy'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'},
      {'hrsh7th/nvim-cmp'}
    }
  }
end)
