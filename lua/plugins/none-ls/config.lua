local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- Lua
    null_ls.builtins.formatting.stylua,
  },
})
