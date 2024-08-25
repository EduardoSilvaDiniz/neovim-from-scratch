local lspConfigs = require("custom.lsp-config")
return {
  "neovim/nvim-lspconfig",
  cmd = { "LspInfo", "LspInstall", "LspStart" },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    lspConfigs.startCustomServers()
  end,
}
