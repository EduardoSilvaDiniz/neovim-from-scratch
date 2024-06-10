local betterTerm = require('betterTerm')
local keymap = vim.keymap.set

-- toggle term
keymap({"n", "t"}, "<C-t>", betterTerm.open, { desc = "Open terminal"})

-- config default
betterTerm.setup {
  prefix = "CRAG_",
  startInserted = false,
  position = "bot",
  size = 18
}
