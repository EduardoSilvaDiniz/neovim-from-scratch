return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
    'mireq/luasnip-snippets',
  },
  build = "make install_jsregexp",
  opts = {
    theme = "gruvbox-baby",
  },
  init = function()
    local ls = require('luasnip')
    ls.setup({
      load_ft_func = require('luasnip_snippets.common.snip_utils').load_ft_func,
      ft_func = require('luasnip_snippets.common.snip_utils').ft_func,
      enable_autosnippets = true,
    })
  end
}
