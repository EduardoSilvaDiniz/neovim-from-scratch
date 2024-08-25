local verSystem = require("custom.verification-nixos")
return {
  "mfussenegger/nvim-lint",
  dependencies = {
    "rshkarin/mason-nvim-lint",
  },
  config = function()
    if verSystem.verificationIsNotNix() then
      require("mason-nvim-lint").setup({
        quiet_mode = true,
      })
    end
  end,
}
