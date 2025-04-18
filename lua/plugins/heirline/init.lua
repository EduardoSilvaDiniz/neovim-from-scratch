 if true then
 	return {}
 end
return {
	"rebelot/heirline.nvim",
	-- opts = require("plugins.heirline.config"),
	config = function ()
		local config = require("plugins.heirline.config")
		require("heirline").setup(config)
	end
}
