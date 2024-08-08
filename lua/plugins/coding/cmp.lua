return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
  },
  config = function()
    local cmpConfig = require("custom.cmp-config")
    require("cmp").setup({
      cmpConfig:addSnippetsFromFriendlySnippets(),
      cmpConfig:addPairsAutomaticallyByAutopairs(),
      cmpConfig:addAutocompleteOnCommandline(),
      cmpConfig:addAutocompleteOnSearching(),
      cmpConfig:setupConfigs(),
    })
  end,
}
