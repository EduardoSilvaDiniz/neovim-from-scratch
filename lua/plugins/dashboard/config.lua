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
			{ action = "", desc = " Find File", icon = " ", key = "f" },
			{ action = "", desc = " New File", icon = " ", key = "n" },
			{ action = "", desc = " Recent File", icon = " ", key = "r" },
			{ action = "Telescope neovim-project discover", desc = " Project", icon = " ", key = "p" },
			{ action = "", desc = " Restore Session", icon = " ", key = "s" },
			{ action = "", desc = " config", icon = " ", key = "c" },
			{ action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
			{ action = "q!", desc = " Quit", icon = " ", key = "q" },
		},
		footer = function()
			return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
		end,
	},
})
