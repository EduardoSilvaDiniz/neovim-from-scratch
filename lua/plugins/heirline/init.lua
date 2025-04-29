if true then
	return {}
end
return {
	"rebelot/heirline.nvim",
	opts = function (opts)
		local config = require("plugins.heirline.config")
		return config
	end,
}
