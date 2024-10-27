if true then
  return {}
end
return {
	"ej-shafran/compile-mode.nvim",
	branch = "latest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "m00qek/baleia.nvim", branch = "v1.3.0" },
	},
	config = function()
		---@type CompileModeOpts
		vim.g.compile_mode = {
			baleia_setup = true,
		}
	end,
}
