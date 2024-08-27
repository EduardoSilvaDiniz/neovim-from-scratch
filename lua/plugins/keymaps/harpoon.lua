return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  keys = function()
    local harpoon = require("harpoon")
    local telescopeConfig = require("telescope.config").values

    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end
      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = telescopeConfig.file_previewer({}),
        sorter = telescopeConfig.generic_sorter({}),
      }):find()
    end
    return {
      {
        "<leader>hq",
        function()
          toggle_telescope(harpoon:list())
        end,
        desc = "[Q]uery marks",
      },

      {
        "<leader>hd",
        function()
          harpoon:list():add()
        end,
        desc = "a[D]d mark"
      },

      {
        "<leader>hs",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "[S]earch quick menu"
      },

      {
        "1",
        function()
          harpoon:list():select(1)
        end,
        desc = "select 1"
      },

      {
        "2",
        function()
          harpoon:list():select(2)
        end,
        desc = "select 2"
      },

      {
        "3",
        function()
          harpoon:list():select(3)
        end,
        desc = "select 3"
      },

      {
        "4",
        function()
          harpoon:list():select(4)
        end,
        desc = "select 4"
      },

      {
        "<leader>ha",
        function()
          harpoon:list():prev()
        end,
        desc = "prov select"
      },
      {
        "<leader>hl",
        function()
          harpoon:list():next()
        end,
        desc = "next select"
      },
    }
  end,
}
