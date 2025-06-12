return function()
	local ft = require("guard.filetype")
	ft("c"):fmt("clang-format"):append({ cmd = "cppcheck" })
	ft("cloujure"):lint({ cmd = "clj-kondo", args = "--lint" })
	ft("go"):fmt("gofumpt"):fmt("golines"):fmt("goimports")
	ft("java"):fmt("google-java-format")
	ft("lua"):fmt("stylua")
	ft("make"):lint({ cmd = "cmakelint" })
	-- ft("nix"):fmt("alejandra"):fmt("deadnix")
	ft("python"):fmt("black"):fmt("isort"):lint("pylint")
	ft("rust"):fmt("rustfmt")
	ft("sh"):fmt("shfmt")
	ft("sql"):fmt({
		cmd = "sql-formatter",
		args = { "-l", "postgresql", "--fix" },
		fname = true,
	})
	ft("html,css,typescript,javascript,typescriptreact,yaml,json,markdown"):fmt("prettier")
end
