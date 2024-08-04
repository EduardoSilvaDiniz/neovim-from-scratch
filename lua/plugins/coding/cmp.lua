return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
  },
  config = function()
    local cmpConnect = require("custom.cmp-connect")
    local cmpConfig = require("custom.class-cmp")
    require("cmp").setup({
      cmpConnect.addSnippetsFromFriendlySnippets(),
      cmpConnect.addPairsAutomaticallyByAutopairs(),
      cmpConnect.addAutocompleteOnCommandline(),
      cmpConnect.addAutocompleteOnSearching(),
      cmpConfig:setupConfigs(),
    })
  end,
}
