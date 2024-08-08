return {
  "CRAG666/betterTerm.nvim",
  keys = {
    { "<C-;>", function() require("betterTerm").open() end, desc = "Open terminal", mode = { "n", "t" }, },
  },
}
