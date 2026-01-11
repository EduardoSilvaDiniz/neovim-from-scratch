return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  config = function()
    require("gitsigns").setup {
      signs = {
        add          = { text = '+' },
        change       = { text = '~' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gs = require("gitsigns")

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        -- Navegar entre hunks
        map("n", "]g", gs.nav_hunk('next'), "Next Hunk")
        map("n", "[g", gs.nav_hunk('prev'), "Prev Hunk")

        -- Ações em hunk
        map("n", "<leader>gs", gs.stage_hunk, "Stage Hunk")
        map("n", "<leader>gr", gs.reset_hunk, "Reset Hunk")
        map("v", "<leader>gs", function() gs.stage_hunk({vim.fn.line("."), vim.fn.line("v")}) end, "Stage Hunk (visual)")
        map("v", "<leader>gr", function() gs.reset_hunk({vim.fn.line("."), vim.fn.line("v")}) end, "Reset Hunk (visual)")

        -- Preview do hunk
        map("n", "<leader>gd", gs.preview_hunk, "Preview Hunk")

        -- Ver diff do buffer atual
        map("n", "<leader>gD", gs.diffthis, "Diff This")
      end,
    }
  end,
}

