return {
  "coffebar/neovim-project",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "Shatur/neovim-session-manager",
  },
  lazy = false,
  priority = 100,
  opts = {
    projects = {
      "~/Projetos/*",
      "~/.config/*",
    },
  },
  init = function()
    vim.opt.sessionoptions:append("globals")
  end,
}
