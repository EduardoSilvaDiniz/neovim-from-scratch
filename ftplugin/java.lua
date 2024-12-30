local config = {
	cmd = { "/nix/store/014m3wvsnfskhpcxqk58qjnpsvrlsg20-user-environment/bin/jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}
local jdtls = require("jdtls")

vim.keymap.set("n", "<A-o>", jdtls.organize_imports, { desc = "Organize imports" })
vim.keymap.set("n", "<leader>cra", jdtls.extract_variable, { desc = "Extract variable" })
vim.keymap.set("n", "<leader>crd", jdtls.extract_constant, { desc = "Extract constant" })
vim.keymap.set("v", "<leader>crm", jdtls.extract_method, { desc = "Extract method" })

-- nvim-dap mappings (requires java-debug and vscode-java-test bundles)
vim.keymap.set("n", "<leader>df", jdtls.test_class, { desc = "Run test class" })
vim.keymap.set("n", "<leader>dn", jdtls.test_nearest_method, { desc = "Run nearest test method" })

require("jdtls").start_or_attach(config)
