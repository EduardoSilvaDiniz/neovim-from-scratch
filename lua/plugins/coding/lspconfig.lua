local lspConfigs = require("actions.lspconfig")

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
        if server_name ~= "jdtls" then
          require("lspconfig")[server_name].setup({
            capabilities = lspConfigs.extendCapabilities(),
          })
        end
      end,
    })

    lspConfigs.startCustomServers()
  end,
}
