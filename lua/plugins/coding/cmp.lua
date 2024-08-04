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
    require("cmp").setup({
      cmpConnect.addSnippetsFromFriendlySnippets(),
      cmpConnect.addPairsAutomaticallyByAutopairs(),
      cmpConnect.addAutocompleteOnCommandline(),
      cmpConnect.addAutocompleteOnSearching(),
      window = require("custom.cmp-configs"),
      enabled = require("custom.cmp-enabled"),
      mapping = require("custom.cmp-mapping"),
      sources = require("custom.cmp-sources"),
      sorting = require("custom.cmp-sorting"),
      formatting = require("custom.cmp-formatting"),
      confirmation = require("custom.cmp-confirmation"),
      preselect = require("cmp").PreselectMode.None,
      snippet = cmpConnect.connectLuasnipOnCmp()
    })
  end,
}
