local keymap = vim.keymap
keymap.set("n", "<leader>cdb", "<cmd>DapToggleBreakpoint<cr>", { desc = "Add breakpoint at line" })
keymap.set("n", "<leader>od", "<cmd>DapContinue<cr>", { desc = "Start debugger" })
