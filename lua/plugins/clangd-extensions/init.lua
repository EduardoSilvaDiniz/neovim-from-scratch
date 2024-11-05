return {
	"p00f/clangd_extensions.nvim",
	lazy = true,
	ft = { "c", "cpp" },
	config = function()
		require("plugins.clangd-extensions.config")
	end,
}
