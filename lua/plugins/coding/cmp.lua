return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
  },
  config = function()
<<<<<<< HEAD
    local cmpConfig = require("Configs.cmp")
=======
    local cmpConfig = require("custom.CmpConfig")
>>>>>>> parent of fa5e447 (code refactoring, trying to create a factory for the plugin settings)
    require("cmp").setup({
      cmpConfig:addSnippetsFromFriendlySnippets(),
      cmpConfig:addPairsAutomaticallyByAutopairs(),
      cmpConfig:addAutocompleteOnCommandline(),
      cmpConfig:addAutocompleteOnSearching(),
      cmpConfig:setupConfigs(),
    })
  end,
}
