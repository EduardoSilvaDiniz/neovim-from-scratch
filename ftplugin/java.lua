local config = {
	cmd = { "/nix/store/014m3wvsnfskhpcxqk58qjnpsvrlsg20-user-environment/bin/jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}

require("core.keymaps").manual_load("jdtls")
require("jdtls").start_or_attach(config)
