local verSystem = require("custom.verification-nixos")
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    if verSystem.verificationIsNotNix() then
      require("mason-nvim-dap").setup()
    end
  end,
}
