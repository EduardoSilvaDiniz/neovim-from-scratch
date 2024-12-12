local ts = require("nvim-treesitter")
local tsConfig = require("nvim-treesitter.configs")

ts.setup()
tsConfig.setup({
  ensure_installed = "",
  sync_install = true,
  auto_install = true,
  TSUpdate = true,
  ignore_install = {},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
  },
  modules = {},
  parser_install_dir = nil,
})
