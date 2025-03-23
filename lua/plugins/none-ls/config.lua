return function(_, opts)
	local nls = require("null-ls")
	opts.root_dir = opts.root_dir
			or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
	opts.sources = vim.list_extend(opts.sources or {}, {
		-- Nix
		nls.builtins.formatting.alejandra,
		nls.builtins.code_actions.statix,
		nls.builtins.diagnostics.deadnix,

		-- Lua
		nls.builtins.formatting.stylua,

		-- Typescript
		-- nls.builtins.code_actions.eslint,
		nls.builtins.formatting.prettier,
		nls.builtins.code_actions.refactoring,
	})
end
