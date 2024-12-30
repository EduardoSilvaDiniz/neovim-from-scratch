local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		-- C/C++
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.diagnostics.cppcheck,

		-- Editorconfig
    null_ls.builtins.diagnostics.editorconfig_checker,

		-- Java
		null_ls.builtins.formatting.google_java_format,
		null_ls.builtins.diagnostics.checkstyle,
		null_ls.builtins.diagnostics.pmd,

		-- Nix
		null_ls.builtins.formatting.alejandra,
		null_ls.builtins.code_actions.statix,
		null_ls.builtins.diagnostics.deadnix,

		-- Lua
		null_ls.builtins.formatting.stylua,
	},
})
