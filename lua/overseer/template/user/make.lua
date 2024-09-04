return {
	name = "Make",
	builder = function()
		local file = vim.fn.expand("%:p")
		return {
			cmd = { "make", "-C", "./out" },
		}
	end,
	condition = {
		filetype = { "cpp", "c" },
	},
}
