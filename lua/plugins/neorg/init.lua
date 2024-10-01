return {
	"nvim-neorg/neorg",
	lazy = false,
	version = "*",
	config = function()
		require("plugins.neorg.config")
	end,
}
