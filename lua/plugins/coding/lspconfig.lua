local lspConfigs = require("custom.lsp-config")
return {
  "neovim/nvim-lspconfig",
  cmd = { "LspInfo", "LspInstall", "LspStart" },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = lspConfigs.extendCapabilities(),
        })
      end,
    })

    lspConfigs.startCustomServers()
  end,
}
