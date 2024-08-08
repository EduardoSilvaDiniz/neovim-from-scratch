return {
  "akinsho/bufferline.nvim",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle Pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>",          desc = "Delete Other Buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>",           desc = "Delete Buffers to the Right" },
    { "<leader>by", "<Cmd>BufferLineCloseLeft<CR>",            desc = "Delete Buffers to the Left" },
    { "<leader>ba", "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev Buffer" },
    { "<leader>bl", "<cmd>BufferLineCycleNext<cr>",            desc = "Next Buffer" },
    { "<leader>bd", "<cmd>bd<cr>",                             desc = "delete buffer" },
    { "<leader>bs", "<cmd>w<cr>",                              desc = "Save Buffer" },
  },
}
