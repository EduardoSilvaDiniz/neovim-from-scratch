return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap = require('dap')
    dap.adapters.java = function(callback)
      callback({
        type = 'server',
        host = '127.0.0.1',
        port = port,
      })
    end
    require("mason-nvim-dap").setup()
  end
}
