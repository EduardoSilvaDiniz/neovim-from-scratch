return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  keys = function()
    local harpoon = require("harpoon")
    local conf = require("telescope.config").values

    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end
      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end
    return {
      {
        "<C-9>",
        function()
          toggle_telescope(harpoon:list())
        end,
        desc = "Open Harpoon window",
      },

      {
        "<leader>a",
        function()
          harpoon:list():add()
        end,
      },

      {
        "<C-e>",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
      },

      {
        "<C-h>",
        function()
          harpoon:list():select(1)
        end,
      },

      {
        "<C-t>",
        function()
          harpoon:list():select(2)
        end,
      },

      {
        "<C-n>",
        function()
          harpoon:list():select(3)
        end,
      },

      {
        "<C-s>",
        function()
          harpoon:list():select(4)
        end,
      },

      {
        "<C-S-P>",
        function()
          harpoon:list():prev()
        end,
      },
      {
        "<C-S-N>",
        function()
          harpoon:list():next()
        end,
      },
    }
  end,
}
