return {
  "mfussenegger/nvim-lint",
  dependencies = {
    "rshkarin/mason-nvim-lint",
  },
  config = function()
    require("mason-nvim-lint").setup({
      quiet_mode = true,
    })
  end,
}
