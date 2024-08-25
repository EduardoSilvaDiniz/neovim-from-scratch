local verSystem = require("custom.verification-nixos")
return {
  "stevearc/conform.nvim",
  dependencies = {
    "zapling/mason-conform.nvim",
  },
  lazy = false,
  config = function()
    require("conform").setup({
      notify_on_error = true,
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })
    if verSystem.verificationIsNotNix() then
      require("mason-conform").setup({
        ignore_install = { "prettier" }, -- List of formatters to ignore during install
      })
    end
  end,
}
