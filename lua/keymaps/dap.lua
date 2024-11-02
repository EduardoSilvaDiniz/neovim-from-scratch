
local keymap = vim.keymap
    keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", {desc = "Add breakpoint at line"})
  keymap.set('n', '<leader>dc', '<cmd>DapContinue<cr>', { desc = 'start or continue the debugger'})
