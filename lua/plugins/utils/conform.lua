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
    require("mason-conform").setup({
      ignore_install = { "prettier" }, -- List of formatters to ignore during install
    })
  end,
}
