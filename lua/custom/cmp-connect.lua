CmpConfig = {}
local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

function CmpConfig.addPairsAutomaticallyByAutopairs()
  return cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

function CmpConfig.addSnippetsFromFriendlySnippets()
  return require("luasnip.loaders.from_vscode").lazy_load()
end

function CmpConfig.addAutocompleteOnSearching()
  return cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })
end

function CmpConfig.addAutocompleteOnCommandline()
  return cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
    matching = { disallow_symbol_nonprefix_matching = false },
  })
end

return CmpConfig
