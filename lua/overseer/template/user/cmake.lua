return {
	name = "Cmake",
	builder = function()
		local file = vim.fn.expand("%:p")
		return {
			cmd = { "cmake", "-B", "./out" },
		}
	end,
	condition = {
		filetype = { "cpp", "c" },
	},
}
