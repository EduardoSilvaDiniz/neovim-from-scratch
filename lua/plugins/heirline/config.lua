local colors = {
	bg = "#282828",
	fg = "#ebdbb2",
	red = "#cc241d",
	green = "#98971a",
	yellow = "#d79921",
	blue = "#458588",
	purple = "#b16286",
	aqua = "#689d6a",
	orange = "#d65d0e",
	gray = "#a89984",
}

return {
	statusline = {
		-- hl = { bg = colors.bg, fg = colors.fg, bold = false },
		require("lib.heirline_macro"),
		require("lib.heirline_vimode"),
		require("lib.heirline_file_name_block"),
		require("lib.heirline_ruler"),
		require("lib.heirline_git"),
		require("lib.heirline_diag").diagnostics(),
	},
	winbar = {},
	tabline = {},
	statuscolumn = {
		require("lib.heirline_gitsigns"),
		require("lib.heirline_statuscolumn"),
	},
	opts = {},
}
