return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    "echasnovski/mini.icons",
  },
  config = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>c", group = "[C]ode" },
      { "<leader>d", group = "[D]ocument" },
      { "<leader>r", group = "[R]ename" },
      { "<leader>s", group = "[S]earch" },
      { "<leader>w", group = "[W]orkspace" },
      { "<leader>t", group = "[T]oggle" },
      { "<leader>h", group = "Git [H]unk" },
      { "<leader>b", group = "[B]uffer" },
      { "<leader>m", group = "[M]oviment" },
      { "<leader>q", group = "[Q]uiting" },
    })
  end,
}
