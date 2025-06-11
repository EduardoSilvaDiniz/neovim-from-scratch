return {
	"nvimdev/guard.nvim",
	dependencies = {
		"nvimdev/guard-collection",
	},
	config = function()
		local ft = require("guard.filetype")
		-- ft("*"):fmt("editorconfig_checker")
		-- ft("asm"):fmt("asmfmt")
		ft("c"):fmt("clang-format"):append({ cmd = "cppcheck" })
		-- ft("clj"):fmt("clj_kondo")
		ft("go"):fmt("gofumpt"):fmt("golines"):fmt("goimports")
		-- ft("html"):lint("djlint"):fmt("prettierd"):fmt("rustywind")
		-- ft("java"):fmt("google_java_format")
		ft("lua"):fmt("stylua")
		-- ft("make"):append({cmd="checkmake"}):fmt("cmake_lint")
		-- ft("md"):fmt("cbfmt"):fmt("ocdc"):fmt("remark"):fmt("textlint")
		-- ft("nix"):fmt("alejandra"):fmt("deadnix")
		ft("py"):fmt("black"):fmt("isort"):lint("pylint")
		ft("rs"):fmt("rustfmt")
		ft("sh"):fmt("shfmt")
		-- ft("sql"):fmt("pg_format"):fmt("sqlformat"):fmt("sqlfmt")
		ft("typescript,javascript,typescriptreact"):fmt('prettier')
		ft("xml"):fmt("xmllint")
		ft("yml"):lint("hadolint")
	end,
}
