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
  hide = { statusline = true },
  config = {
    header = vim.split(logo, "\n"),
    center = {
      {
        desc = " Recently opened files",
        icon = "󰧮 ",
        key = "r",
        keymap = "SPC f r",
        action = "",
      },
      {
        desc = " Reload last session",
        icon = "󰋚 ",
        key = "s",
        keymap = "SPC q l",
        action = "NeovimProjectLoadRecent",
      },
      {
        --#TODO tecla de atalho não existe
        desc = " Open org-agenda",
        icon = "󰃮 ",
        key = "a",
        keymap = "SPC o A",
        action = "",
      },
      {
        desc = " Open project",
        icon = "󰃖 ",
        key = "p",
        keymap = "SPC p p",
        action = "Telescope neovim-project discover",
      },
      {
        --#TODO tecla de atalho não existe
        desc = " Jump to bookmark",
        icon = "󰃀 ",
        key = "RET",
        keymap = "SPC RET",
        action = "",
      },
      {
        desc = " Open private configuration",
        icon = "󰖷 ",
        key = "p",
        keymap = "SPC f P",
        action = "require('telescope.builtin').find_files({cwd='~/.config/nvim'})",
      },
      {
        desc = " Open package manager",
        icon = "󰏓 ",
        key = "l",
        keymap = "SPC h l",
        action = "Lazy",
      },
      {
        desc = " Quiting neovim",
        icon = "󰈆 ",
        key = "q",
        keymap = "SPC q q",
        action = "q!",
      },
    },
    footer = function()
      local stats = require("lazy").stats()
      local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
      return { "Neovim loaded " .. stats.count .. " plugins in " .. ms .. " ms" }
    end,
  },
})
