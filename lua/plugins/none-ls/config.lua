return function(_, opts)
	local nls = require("null-ls")
	opts.root_dir = opts.root_dir
			or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
	opts.sources = vim.list_extend(opts.sources or {}, {
		-- C/C++
		nls.builtins.formatting.clang_format,
		nls.builtins.diagnostics.cppcheck,

		-- Editorconfig
		nls.builtins.diagnostics.editorconfig_checker,

		-- Java
		nls.builtins.formatting.google_java_format,
		nls.builtins.diagnostics.checkstyle,
		nls.builtins.diagnostics.pmd,

		-- Go
		nls.builtins.formatting.gofumpt,
		nls.builtins.formatting.golines,
		nls.builtins.formatting.goimports,
		nls.builtins.formatting.goimports_reviser,
		nls.builtins.diagnostics.golangci_lint,
		nls.builtins.code_actions.gomodifytags,

		-- Nix
		nls.builtins.formatting.alejandra,
		nls.builtins.code_actions.statix,
		nls.builtins.diagnostics.deadnix,

		-- Lua
		nls.builtins.formatting.stylua,
	})
end
