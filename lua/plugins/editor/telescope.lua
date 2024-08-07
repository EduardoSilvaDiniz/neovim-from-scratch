local builtin = require("telescope.builtin")
local builtinCustom = require("custom.telescope-builtin")

return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-fzf-native.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  keys = {
    { "<leader><leader>", builtinCustom.searchinOpenFiles(), desc = "[S]earch [/] in Open Files" },
    { "<leader>sn",       builtinCustom.searchinOpenFiles(), desc = "[S]earch [N]eovim files" },
    { "<leader>sh",       builtin.help_tags,                 desc = "[S]earch [H]elp" },
    { "<leader>sk",       builtin.keymaps,                   desc = "[S]earch [K]eymaps" },
    { "<leader>sf",       builtin.find_files,                desc = "[S]earch [F]iles" },
    { "<leader>ss",       builtin.builtin,                   desc = "[S]earch [S]elect Telescope" },
    { "<leader>sw",       builtin.grep_string,               desc = "[S]earch current [W]ord" },
    { "<leader>sg",       builtin.live_grep,                 desc = "[S]earch by [G]rep" },
    { "<leader>sd",       builtin.diagnostics,               desc = "[S]earch [D]iagnostics" },
    { "<leader>sr",       builtin.resume,                    desc = "[S]earch [R]esume" },
    { "<leader>s.",       builtin.oldfiles,                  desc = '[S]earch Recent Files ("." for repeat)' },
    { "<leader>sb",       builtin.buffers,                   desc = "[ ] Find existing buffers" },
  },
  config = function()
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    require("telescope").setup({
      defaults = {
        borderchars = {
          prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
          results = { " " },
          preview = { " " },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })
  end,
}
