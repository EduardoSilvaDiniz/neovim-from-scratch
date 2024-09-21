local cmd = {}

cmd = { vim.fn.system("nix eval -f '<nixpkgs>' --raw jdt-language-server") .. "/bin/jdtls" }

local config = {
	cmd = cmd,
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}
require("jdtls").start_or_attach(config)
