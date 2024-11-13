local keymap = vim.keymap
local dap = require("dap")

keymap.set("n", "<F12>", function()
  dap.step_out()
end)

keymap.set("n", "<leader>tb", function()
  dap.toggle_breakpoint()
end, { desc = "Add breakpoint at line" })

keymap.set("n", "<leader>od", function()
  dap.continue()
end, { desc = "Start debugger" })

vim.keymap.set("n", "<Leader>or", function()
  dap.repl.open()
end, { desc = "Open repl dap" })
