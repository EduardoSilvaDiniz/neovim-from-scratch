M = {}
local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local function setWindow()
  return {
    completion = cmp.config.window.bordered({
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None,CursorLine:MyCursorLine",
      side_padding = 0,
    }),
  }
end

local function setSnippet()
  return {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  }
end

local function setEnabled()
  return {
    function()
      local context = require("cmp.config.context")
      if vim.api.nvim_get_mode().mode == "c" then
        return true
      else
        return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
      end
    end,
  }
end

local function setMapping()
  local cmp_action = require("custom.cmp-mapping-action")
  return {
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-f"] = cmp_action.luasnip_jump_forward(),
    ["<C-b"] = cmp_action.luasnip_jump_backward(),
    ["<Tab>"] = cmp_action.luasnip_supertab(),
    ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
  }
end

local function setSources()
  return {
    { name = "luasnip", keyword_length = 2 },
    { name = "nvim_lsp" },
    { name = "buffer",  keyword_length = 3 },
    { name = "path" },
  }
end

local function setSorting()
  return {
    comparators = {
      cmp.config.compare.exact,
      cmp.config.compare.recently_used,
      cmp.config.compare.score,
    },
  }
end

local function setPreselect()
  return require("cmp").PreselectMode.None
end

local function setFormatting()
  local icons = require("consts.icons")
  vim.api.nvim_set_hl(0, "MyCursorLine", { bg = "#988829", fg = "#000000", bold = true })
  return {
    fields = { "kind", "abbr", "menu" },
    format = function(_, vim_item)
      local kind = vim_item.kind
      vim_item.kind = icons[vim_item.kind] or ""
      vim_item.menu = " (" .. kind .. ") "

      return vim_item
    end,
  }
end

local function setConfirmation()
  return {
    completeopt = "menu,menuone,noinsert"
  }
end

function M.setupConfigs()
  return cmp.setup({
    snippet = setSnippet(),
    window = setWindow(),
    enabled = setEnabled(),
    mapping = setMapping(),
    sources = setSources(),
    sorting = setSorting(),
    preselect = setPreselect(),
    formatting = setFormatting(),
    confirmation = setConfirmation(),
  })
end

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

return M
