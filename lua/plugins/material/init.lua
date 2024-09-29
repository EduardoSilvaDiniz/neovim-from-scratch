return {
	"marko-cerovac/material.nvim",
	config = function()
		require("plugins.material.config")

		vim.cmd("colorscheme material-darker")
		vim.g.material_style = "dacker"
	end,
}
