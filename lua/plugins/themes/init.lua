return {
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("everforest")
		end,
	},
  -- others themes i testing
	-- 	"rebelot/kanagawa.nvim",
	-- 	"catppuccin/nvim",
	-- 	"marko-cerovac/material.nvim",
	-- 	"f4z3r/gruvbox-material.nvim",
  -- 	"morhetz/gruvbox",
}
