local cmp = require("cmp")
local cmp_action = require("custom.cmp-action")
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
