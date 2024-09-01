return {
  'echasnovski/mini.nvim',
  version = '*',
  keys = {
    { "<leader>cg", "<cmd>LazyGit<cr>",              desc = "LazyGit" },
    { "<leader>e",  "<cmd>lua MiniFiles.open()<cr>", desc = "Open Mini.files", },
  },
  config = function()
  end
}
