local utils = require "lib.utils"
return function(_, opts)
	local null_ls = require("null-ls")
	opts.root_dir = opts.root_dir
			or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")

	opts.sources = {}

	if utils.whoa_system("nixos") then
		opts.sources = vim.list_extend(opts.sources or {}, {
			null_ls.builtins.formatting.alejandra,
			null_ls.builtins.code_actions.statix,
			null_ls.builtins.diagnostics.deadnix,
		})
	end

	utils.add_formatter_if_lsp("clangd", opts.sources, {
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.diagnostics.cppcheck,
		null_ls.builtins.diagnostics.gccdiag,
	})

	utils.add_formatter_if_lsp("jdtls", opts.sources, {
		null_ls.builtins.formatting.google_java_format,
		null_ls.builtins.diagnostics.checkstyle,
		null_ls.builtins.diagnostics.pmd,
	})

	utils.add_formatter_if_lsp("gopls", opts.sources, {
		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.golines,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.goimports_reviser,
		null_ls.builtins.diagnostics.golangci_lint,
		null_ls.builtins.diagnostics.revive,
		null_ls.builtins.code_actions.gomodifytags,
	})

	utils.add_formatter_if_lsp("lua_ls", opts.sources, {
		null_ls.builtins.formatting.stylua,
	})


	-- opts.sources = vim.list_extend(opts.sources or {}, {
	-- C/C++, C#, Java
	-- null_ls.builtins.formatting.uncrustify,

	-- Go, Javascript, Lua, Python, Typescript
	-- null_ls.builtins.code_actions.refactoring,


	-- Clojure
	-- null_ls.builtins.diagnostics.clj_kondo,

	-- Css

	-- Dart
	-- null_ls.builtins.formatting.dart_format,

	-- Docker
	-- null_ls.builtins.diagnostics.hadolint,

	-- Editorconfig
	-- null_ls.builtins.diagnostics.editorconfig_checker,

	-- Gradle
	-- null_ls.builtins.diagnostics.npm_groovy_lint,

	-- Java

	-- Javascript/Typescript
	-- null_ls.builtins.formatting.prettier,

	-- Go

	-- Spell
	-- null_ls.builtins.completion.spell,


	-- Html
	-- null_ls.builtins.diagnostics.tidy,
	-- null_ls.builtins.formatting.djlint,
	-- null_ls.builtins.formatting.prettierd,

	-- html, Markdown
	-- null_ls.builtins.formatting.rustywind,

	-- Markdown
	-- null_ls.builtins.formatting.cbfmt,
	-- null_ls.builtins.formatting.ocdc,
	-- null_ls.builtins.formatting.remark,
	-- null_ls.builtins.formatting.textlint,
	-- null_ls.builtins.diagnostics.alex,
	-- null_ls.builtins.diagnostics.ltrs,
	-- null_ls.builtins.diagnostics.markdownlint_cli2,
	-- null_ls.builtins.diagnostics.mdl,
	-- null_ls.builtins.diagnostics.proselint,
	-- null_ls.builtins.diagnostics.textidote,
	-- null_ls.builtins.diagnostics.vale,
	-- null_ls.builtins.diagnostics.write_good,

	-- Make
	-- null_ls.builtins.diagnostics.checkmake,
	-- null_ls.builtins.diagnostics.cmake_lint,


	-- PHP
	-- null_ls.builtins.formatting.phpcbf,
	-- null_ls.builtins.formatting.phpcsfixer,
	-- null_ls.builtins.formatting.pretty_php
	-- null_ls.builtins.diagnostics.phpstan,
	-- null_ls.builtins.diagnostics.phpcs,
	-- null_ls.builtins.diagnostics.phpmd,

	-- Python
	-- null_ls.builtins.diagnostics.pylint.with({
	--   diagnostics_postprocess = function(diagnostic)
	--     diagnostic.code = diagnostic.message_id
	--   end,
	-- }),
	-- null_ls.builtins.formatting.black,
	-- null_ls.builtins.formatting.isort,

	-- Lua

	-- Rust
	-- null_ls.builtins.formatting.dxfmt,
	-- null_ls.builtins.formatting.leptosfmt,

	-- Shellscript
	-- null_ls.builtins.formatting.shellharden,
	-- null_ls.builtins.formatting.shfmt,
	-- null_ls.builtins.diagnostics.dotenv_linter,
	-- null_ls.builtins.hover.printenv,

	-- Sql
	-- null_ls.builtins.formatting.pg_format,
	-- null_ls.builtins.formatting.sqlformat,
	-- null_ls.builtins.formatting.sql_formatter,
	-- null_ls.builtins.formatting.sqlfmt,
	-- null_ls.builtins.formatting.sqlfluff.with({
	--   extra_args = { "--dialect", "postgres" }, -- change to your dialect
	-- }),
	-- null_ls.builtins.diagnostics.sqlfluff.with({
	--   extra_args = { "--dialect", "postgres" }, -- change to your dialect
	-- }),

	-- Xml
	-- null_ls.builtins.diagnostics.tidy,
	-- })
end
