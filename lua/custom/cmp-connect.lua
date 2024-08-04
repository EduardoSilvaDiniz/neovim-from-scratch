M = {}
local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

function M.addPairsAutomaticallyByAutopairs()
  return cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

function M.addSnippetsFromFriendlySnippets()
  return require("luasnip.loaders.from_vscode").lazy_load()
end

function M.addAutocompleteOnSearching()
  return cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })
end

function M.addAutocompleteOnCommandline()
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

function M.connectLuasnipOnCmp()
  return {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  }
end

return M
