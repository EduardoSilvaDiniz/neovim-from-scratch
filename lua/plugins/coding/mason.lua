return {
  "williamboman/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  lazy = false,
  config = function()
    require("mason").setup()
    require("mason-tool-installer").setup({
      ensure_installed = require("plugins.coding.servers"),
      auto_update = true,
    })
  end,
}
