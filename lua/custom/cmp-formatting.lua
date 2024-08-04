local icons = require("custom.icons")
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
