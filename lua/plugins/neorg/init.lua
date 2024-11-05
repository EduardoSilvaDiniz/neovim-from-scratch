return {
	"nvim-neorg/neorg",
	lazy = false,
	version = "*",
  ft = "norg",
	config = function()
		require("plugins.neorg.config")
	end,
}
