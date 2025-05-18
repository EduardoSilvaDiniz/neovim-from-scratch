local utils = require("lib.utils")
return function(_, opts)
	local null_ls = require("null-ls")
	opts.root_dir = opts.root_dir
			or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")

	opts.sources = {}

	if utils.whoa_system("linux") then
		opts.sources = vim.list_extend(opts.sources, {
			null_ls.builtins.formatting.alejandra,
			null_ls.builtins.code_actions.statix,
			null_ls.builtins.diagnostics.deadnix,
		})
	end

	utils.add_formatter_if_lsp("clangd", opts.sources, {
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.diagnostics.cppcheck,
		null_ls.builtins.diagnostics.gccdiag,
		-- Make
		null_ls.builtins.diagnostics.checkmake,
		null_ls.builtins.diagnostics.cmake_lint,
	})

	utils.add_formatter_if_lsp("jdtls", opts.sources, {
		null_ls.builtins.formatting.google_java_format,
		-- null_ls.builtins.diagnostics.npm_groovy_lint,
		--TODO pmd não esta disponivel no mason
		-- null_ls.builtins.diagnostics.pmd,

		--TODO checkstyle precisa de ajustes, fica reclamando de indentação
		-- null_ls.builtins.diagnostics.checkstyle.with({
		-- 	extra_args = { "-c", "/home/edu/Projetos/checkstyle.xml" }, -- or "/sun_checks.xml" or path to self written rules
		-- }),
	})

	utils.add_formatter_if_lsp("gopls", opts.sources, {
		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.golines,
		null_ls.builtins.formatting.goimports,
		-- null_ls.builtins.formatting.goimports_reviser,
		-- null_ls.builtins.diagnostics.golangci_lint,
		-- null_ls.builtins.diagnostics.revive,
		null_ls.builtins.code_actions.gomodifytags,
	})

	utils.add_formatter_if_lsp("lua_ls", opts.sources, {
		null_ls.builtins.formatting.stylua,
	})

	utils.add_formatter_if_lsp("typescript-tools", opts.sources, {
	})

	utils.add_formatter_if_lsp("clojure-lsp", opts.sources, {
		null_ls.builtins.diagnostics.clj_kondo,
	})

	utils.add_formatter_if_lsp("html", opts.sources, {
		null_ls.builtins.formatting.djlint,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.rustywind,
	})

	utils.add_formatter_if_lsp("markdown_oxide", opts.sources, {
		null_ls.builtins.formatting.cbfmt,
		null_ls.builtins.formatting.ocdc,
		null_ls.builtins.formatting.remark,
		null_ls.builtins.formatting.textlint,
		null_ls.builtins.diagnostics.alex,
		null_ls.builtins.diagnostics.ltrs,
		null_ls.builtins.diagnostics.markdownlint_cli2,
		null_ls.builtins.diagnostics.mdl,
		null_ls.builtins.diagnostics.proselint,
		null_ls.builtins.diagnostics.textidote,
		null_ls.builtins.diagnostics.vale,
		null_ls.builtins.diagnostics.write_good,
	})

	utils.add_formatter_if_lsp("phpactor", opts.sources, {
		null_ls.builtins.formatting.phpcbf,
		null_ls.builtins.formatting.phpcsfixer,
		null_ls.builtins.formatting.pretty_php,
		null_ls.builtins.diagnostics.phpstan,
		null_ls.builtins.diagnostics.phpcs,
		null_ls.builtins.diagnostics.phpmd,
	})

	utils.add_formatter_if_lsp("pyright", opts.sources, {
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.diagnostics.pylint.with({
			diagnostics_postprocess = function(diagnostic)
				diagnostic.code = diagnostic.message_id
			end,
		}),
	})

	utils.add_formatter_if_lsp("rust-analyzer", opts.sources, {
		null_ls.builtins.formatting.dxfmt,
		null_ls.builtins.formatting.leptosfmt,
	})

	utils.add_formatter_if_lsp("bashls", opts.sources, {
		null_ls.builtins.formatting.shellharden,
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.diagnostics.dotenv_linter,
		null_ls.builtins.hover.printenv,
	})

	utils.add_formatter_if_lsp("sqlls", opts.sources, {
		null_ls.builtins.formatting.pg_format,
		null_ls.builtins.formatting.sqlformat,
		null_ls.builtins.formatting.sql_formatter,
		null_ls.builtins.formatting.sqlfmt,
		null_ls.builtins.formatting.sqlfluff.with({
			extra_args = { "--dialect", "postgres" },
		}),
		null_ls.builtins.diagnostics.sqlfluff.with({
			extra_args = { "--dialect", "postgres" },
		}),
	})

	opts.sources = vim.list_extend(opts.sources or {}, {
		null_ls.builtins.formatting.prettier,

		-- C/C++, C#, Java
		null_ls.builtins.formatting.uncrustify,

		-- Go, Javascript, Lua, Python, Typescript
		null_ls.builtins.code_actions.refactoring,

		-- Docker
		null_ls.builtins.diagnostics.hadolint,

		-- Editorconfig
		null_ls.builtins.diagnostics.editorconfig_checker,

		-- Spell
		null_ls.builtins.completion.spell,

		-- Xml
		null_ls.builtins.formatting.xmllint,
	})
end
