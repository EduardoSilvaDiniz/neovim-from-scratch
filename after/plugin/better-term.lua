local betterTerm = require('betterTerm')
local keymap = vim.keymap.set
--local current = 2

-- toggle term
keymap({"n", "t"}, "<C-t>", betterTerm.open, { desc = "Open terminal"})

-- config default
betterTerm.setup {
  prefix = "CRAG_",
  startInserted = false,
  position = "bot",
  size = 18
}

-- Select term focus
--keymap({"n"}, "<leader>tt", betterTerm.select, { desc = "Select terminal"})

-- integration code_runner
--keymap("n", "<leader>tna", function()
--  require("betterTerm").send(require("code_runner.commands").get_filetype_command(), 1, { clean = false, interrupt = true })
--end, { desc = "Execute File"})
--
---- Create new term
--keymap(
--    {"n"}, "<leader>tn",
--    function()
--        betterTerm.open(current)
--        current = current + 1
--    end,
--    { desc = "New terminal"}
--)


