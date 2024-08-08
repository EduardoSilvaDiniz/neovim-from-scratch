return {
  "nvimdev/dashboard-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "VimEnter",
  config = function()
    local buttons = require("custom.dashboard-buttons")
    local logo = string.rep("\n", 8) .. require("consts.logo") .. "\n\n"

    require("dashboard").setup({
      theme = "doom",
      hide = { statusline = false },
      config = {
        header = vim.split(logo, "\n"),
        center = {
          { action = buttons.findFiles(), desc = " Find File", icon = " ", key = "f" },
          { action = buttons.openNewFile(), desc = " New File", icon = " ", key = "n" },
          { action = buttons.findRecentFiles(), desc = " Recent File", icon = " ", key = "r" },
          { action = buttons.listProjects(), desc = " Project", icon = " ", key = "p" },
          { action = buttons.restoreSession(), desc = " Restore Session", icon = " ", key = "s" },
          { action = buttons.findConfigFiles(), desc = " config", icon = " ", key = "c" },
          { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
          { action = buttons.quitVim, desc = " Quit", icon = " ", key = "q" },
        },
        footer = buttons.configFooter(),
      },
    })
  end,
}
