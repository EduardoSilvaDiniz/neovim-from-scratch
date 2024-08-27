return {
  'stevearc/oil.nvim',
  keys = {
    {
      "<leader>e",
      function()
        local oil = require("oil")
        oil.toggle_float()
        vim.wait(1000, function()
          return oil.get_cursor_entry() ~= nil
        end)
        if oil.get_cursor_entry() then
          oil.open_preview()
        end
      end,
      desc = "[O]il float"
    },
  }
}
