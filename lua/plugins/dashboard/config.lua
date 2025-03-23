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

return {
	theme = "doom",
	hide = { statusline = true },
	config = {
		header = vim.split(logo, "\n"),
		center = {
			{
				desc = " Arquivos abertos recentemente",
				icon = "󰧮 ",
				key = "r",
				keymap = "SPC f r",
				action = "",
			},
			{
				desc = " Recarregar a última sessão",
				icon = "󰋚 ",
				key = "s",
				keymap = "SPC q l",
				action = "NeovimProjectLoadRecent",
			},
			{
				desc = " pesquisar projetos",
				icon = "󰃖 ",
				key = "p",
				keymap = "SPC p p",
				action = "Telescope neovim-project discover",
			},
			{
				desc = " abrir configuração do neovim",
				icon = "󰖷 ",
				key = "n",
				keymap = "SPC f P",
				action = "require('telescope.builtin').find_files({cwd='~/.config/nvim'})",
			},
			{
				desc = " abrir gerenciador de pacotes",
				icon = "󰏓 ",
				key = "l",
				keymap = "SPC h l",
				action = "Lazy",
			},
			{
				desc = " sair do neovim",
				icon = "󰈆 ",
				key = "q",
				keymap = "SPC q q",
				action = "q!",
			},
		},
		footer = function()
			local stats = require("lazy").stats()
			local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
			return { "Neovim carregou " .. stats.count .. " plugins em " .. ms .. " ms" }
		end,
	},
}
