local neorg = require("neorg")

neorg.setup({
  load = {
    ["core.defaults"] = {},
    ["core.concealer"] = {},
    ["core.dirman"] = {
      config = {
        workspaces = {
          notes = "~/notes",
        },
        default_workspace = "notes",
      },
    },
    ["core.keybinds"] = {
      config = {
        default_keybinds = false,
      },
    },
  },
})

vim.wo.foldlevel = 99
vim.wo.conceallevel = 2
