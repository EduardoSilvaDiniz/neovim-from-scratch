-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },

    auto_close = true,
    auto_reload_on_write = true,
    update_focused_file = {
        enable      = true
    },
    diagnostics = {
        enable = false,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        }
    }

})
