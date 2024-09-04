return {
	"Civitasv/cmake-tools.nvim",
	config = function()
		local osys = require("cmake-tools.osys")
		require("cmake-tools").setup({
			cmake_build_directory = function()
				if osys.iswin32 then
					return "out\\${variant:buildType}"
				end
				return "out/${variant:buildType}"
			end,
		})
	end,
}
