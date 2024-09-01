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
      },
      formatters_by_ft = {
        lua = { "stylua", "lua-format" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        python = { "isort", "black" },
        rust = { "rustfmt" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        java = { "google-java-format", "checkstyle" },
        php = { "php_cs_fixer", "phpcbf", "phpinsights", "pint", "pretty-php" },
        go = { "gofmt", "gofumpt", "gosimports", "goimports-reviser", "golines" },
        html = { "djlint", "htmlbeautifier" },
        css = { "rustywind", "stylelint" },
        dart = { "dart_format", "dcm_format" },
        cmake = { "cmake_format", "gersemi" },
        make = { "gersemi" },
        shellscript = { "shfmt" },
      },
    })
    if verSystem.verificationIsNotNix() then
      require("mason-conform").setup({
        ignore_install = { "prettier" },
      })
    end
  end,
}
