local lspConfigs = require("custom.lsp-mapping")
return {
  "neovim/nvim-lspconfig",
  cmd = { "LspInfo", "LspInstall", "LspStart" },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    lspConfigs.extendLspAttach()
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = lspConfigs.extendCapabilities(),
        })
      end,
    })

    require("custom.lsp-mapping").startCustomServers()
  end,
}
