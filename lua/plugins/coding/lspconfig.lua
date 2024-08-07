<<<<<<< HEAD
local lspConfigs = require("actions.lspconfig")

=======
local lspConfigs = require("custom.lsp-mapping")
>>>>>>> parent of fa5e447 (code refactoring, trying to create a factory for the plugin settings)
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

<<<<<<< HEAD
    lspConfigs.startCustomServers()
=======
    require("custom.lsp-mapping").startCustomServers()
>>>>>>> parent of fa5e447 (code refactoring, trying to create a factory for the plugin settings)
  end,
}
