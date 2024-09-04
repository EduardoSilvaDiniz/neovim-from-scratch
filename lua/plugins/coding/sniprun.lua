return {
	"michaelb/sniprun",
	branch = "master",
	build = "sh install.sh",
	config = function()
		require("sniprun").setup({
			interpreter_options = {
				C_original = {
					compiler = "clang --debug",
				},
				Cpp_original = {
					compiler = "cmake .. && make",
				},
			},
		})
	end,
}
