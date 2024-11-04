local stats = require("lazy").stats()
local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
local logo = [[
=================     ===============     ===============   ========  ========
\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
||.=='    _-'                                                     `' |  /==.||
=='    _-'                        N E O V I M                         \/   `==
\   _-'                                                                `-_   /
 `''                                                                      ``'
]]

require("dashboard").setup({
	theme = "doom",
	hide = { statusline = false },
	config = {
		header = vim.split(logo, "\n"),
		center = {
			{ desc = " Recently opened files", icon = "󰧮 ", key = "SPC f r", action = "" },
			{ desc = " Reload last session", icon = "󰋚 ", key = "SPC q l", action = "NeovimProjectLoadRecent" },
			{ desc = " Open org-agenda", icon = "󰃮 ", key = "SPC o A", action = "" },
			{ desc = " Open project", icon = "󰃖 ", key = "SPC p p", action = "Telescope neovim-project discover" },
			{ desc = " Jump to bookmark", icon = "󰃀 ", key = "SPC RET", action = "" },
			{
				desc = " Open private configuration",
				icon = "󰖷 ",
				key = "SPC f P",
				action = "require('telescope.builtin').find_files({cwd='~/.config/nvim'})",
			},
			{ desc = " Open package manager", icon = "󰏓 ", key = "SPC h l", action = "Lazy" },
			{ desc = " Quiting neovim", icon = "󰈆 ", key = "SPC q q", action = "q!" },
		},
		footer = function()
			return { "Neovim loaded " .. stats.count .." plugins in " .. stats.startuptime .. " ms" }
		end,
	},
})
