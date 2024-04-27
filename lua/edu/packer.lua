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

  -- theme
  use 'morhetz/gruvbox'

  -- navegator 
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- icons
    },
  }

  -- search code
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- project manager
  use({
    "coffebar/neovim-project",
    config = function()
      vim.opt.sessionoptions:append("globals")
      require("neovim-project").setup {
        projects = { -- define project roots
          "~/projects/*",
          "~/.config/*",
        },
      }
    end,
    requires = {
      { "Shatur/neovim-session-manager" },
    }
  })

  -- show signature args
  use 'ray-x/lsp_signature.nvim'

  -- syntax highlight
  use {
    'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'
  }

  -- nãosei
  -- use 'nvim-treesitter/playground'

  -- lsp
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
    }
  }

  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'},
    }
  }

  -- Snippet
  use {
	  "L3MON4D3/LuaSnip",
	  tag = "v2.*",
	  run = "make install_jsregexp",
    requires = {
      'saadparwaiz1/cmp_luasnip'
    }
  }
end)
