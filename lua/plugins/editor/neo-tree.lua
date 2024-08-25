local customCommands = require("custom.neo-tree-commands")

return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  config = function()
    require("neo-tree").setup({
      commands = customCommands,
      source_selector = {
        winbar = true,
        statusline = true,
        sources = {
          { source = "filesystem" },
          { source = "buffers" },
          { source = "git_status" },
          { source = "document_symbols" },
        },
      },
      window = {
        mappings = {
          ["<s-Tab>"] = "prev_source",
          ["<Tab>"] = "next_source",
        },
      },
      filesystem = {
        group_empty_dirs = true,
        window = {
          mappings = {
            l = "child_or_open",
            h = "parent_or_close",
          },
        },
      },
      event_handlers = { {
        event = "file_open_requested",
        handler = function()
          require("neo-tree.command").execute({ action = "close" })
        end,
      }, },
      sources = {
        "filesystem",
        "buffers",
        "git_status",
        "document_symbols",
      },
    })
  end,
}
