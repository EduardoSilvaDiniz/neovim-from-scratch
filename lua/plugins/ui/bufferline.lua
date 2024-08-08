return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        always_show_bufferline = true,
        enforce_regular_tabs = true,
        offsets = {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          separador = true,
        },
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " " or (e == "warning" and " " or " ")
            s = s .. n .. sym
          end
          return s
        end,
      },
    })
  end,
}
