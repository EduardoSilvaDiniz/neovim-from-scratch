return {
  "williamboman/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  build = ":MasonUpdate",
  config = function()
    require("mason").setup()
    require("mason-tool-installer").setup({
      ensure_installed = require("consts.mason-ensure-servers"),
      auto_update = true,
    })
  end,
}
