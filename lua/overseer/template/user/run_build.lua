return {
	name = "run build",
	builder = function()
		local file = vim.fn.expand("%:p")
		return {
			cmd = { "./out/a.out" },

			components = {
				{ "on_output_quickfix", set_diagnostics = true },
				"default",
			},
		}
	end,
	condition = {
		filetype = { "cpp", "c" },
	},
}
