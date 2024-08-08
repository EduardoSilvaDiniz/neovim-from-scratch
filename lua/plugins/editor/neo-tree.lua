local commands = require("custom.neo-tree-commands")
return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  opts = {
    source_selector = {
      winbar = true,
      statusline = true,
    },
    commands = commands,
    event_handlers = {
      {
        event = "file_open_requested",
        handler = function()
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },
    filesystem = {
      group_empty_dirs = true,
      window = {
        mappings = {
          l = "child_or_open",
          h = "parent_or_close",
          ["<CR>"] = nil,
        },
      },
    },
  },
}
