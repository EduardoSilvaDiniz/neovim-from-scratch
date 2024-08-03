return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
  },
  config = function()
    local cmp = require("cmp")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    vim.api.nvim_set_hl(0, "MyCursorLine", { bg = "#988829", fg = "#000000", bold = true })

    -- insert parents automatic
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    -- add snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
      matching = { disallow_symbol_nonprefix_matching = false },
    })

    cmp.setup({
      window = require("custom.cmp-configs"),
      enabled = require("custom.cmp-enabled"),
      mapping = require("custom.cmp-mapping"),
      sources = require("custom.cmp-sources"),
      sorting = require("custom.cmp-sorting"),
      formatting = require("custom.cmp-formatting"),

      confirmation = { completeopt = "menu,menuone,noinsert" },
      preselect = cmp.PreselectMode.None,
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
    })
  end,
}
