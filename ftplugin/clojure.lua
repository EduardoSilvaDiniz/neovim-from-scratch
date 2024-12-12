vim.api.nvim_create_autocmd(
  { "FocusLost", "ModeChanged", "TextChanged", "BufEnter" },
  { desc = "auto load file", pattern = "*", command = "silent! ConjureEvalFile" }
)
