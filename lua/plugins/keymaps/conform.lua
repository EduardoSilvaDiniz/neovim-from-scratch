return {
  "stevearc/conform.nvim",
  keys = {
    { "<leader>f", function() require("conform").format({ async = true, lsp_fallback = true }) end, desc = "[F]ormat buffer", },
  },
}
