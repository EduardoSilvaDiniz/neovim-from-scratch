local verSystem = require("custom.verification-nixos")
local cmd = {}

if verSystem.verificationIsNotNix() then
  cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") }
else
  cmd = { vim.fn.system("nix eval -f '<nixpkgs>' --raw jdt-language-server") .. "/bin/jdtls" }
end

local config = {
  cmd = cmd,
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}
require("jdtls").start_or_attach(config)
