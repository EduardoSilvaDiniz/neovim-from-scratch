local keymap = vim.keymap

keymap.set("n", "<leader>qq", "<cmd>q!<cr>", { desc = "Force Quit" })
keymap.set("n", "<leader>qs", "<cmd>wq<cr>", { desc = "Save And Quit" })

keymap.set("n", ";", ":", { silent = true, desc = "command line" })
keymap.set("n", ":", '<cmd>echo "use ; command"<cr>')
keymap.set("n", "<leader>ml", "<S-a>", { desc = "End Line" })
keymap.set("n", "<leader>ma", "<S-i>", { desc = "Start Line" })
keymap.set("n", "<leader>ms", "<S-s>", { desc = "delete Line" })
keymap.set("n", "<leader>mc", "<S-c>", { desc = "delete ultil the cursor" })
keymap.set("n", "<leader>mv", "<S-v>", { desc = "visual/line mode" })
keymap.set("n", "gu", "gU", { desc = "uppercase" })
keymap.set("n", "gl", "gu", { desc = "lowercase" })

keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "delete buffer" })
keymap.set("n", "<leader>bs", "<cmd>w<cr>", { desc = "Save Buffer" })

keymap.set("n", "<S-i>", '<cmd>echo "use leader + m + h!!"<cr>')
keymap.set("n", "<S-a>", '<cmd>echo "use leader + m + l!!"<cr>')
keymap.set("n", "<S-s>", '<cmd>echo "use leader + m + s!!"<cr>')
keymap.set("n", "<S-c>", '<cmd>echo "use leader + m + c!!"<cr>')
keymap.set("n", "<S-v>", '<cmd>echo "use leader + m + v!!"<cr>')
keymap.set("n", "<C-c>", '<cmd>echo "use C + up/down!!"<cr>')
keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

--keymap.set("n", "<leader>cr", "<cmd>w !node<cr>")
--keymap.set("n", "<leader>cr", "<cmd>w !php<cr>")
keymap.set("n", "<leader>cr", "<cmd>w !lua<cr>")

-- neovim project
keymap.set("n", "<leader>sp", "<cmd>Telescope neovim-project discover<CR>")

-- Debugging
keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
keymap.set("n", '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>")
keymap.set("n", '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>')
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
keymap.set("n", '<leader>df', '<cmd>Telescope dap frames<cr>')
keymap.set("n", '<leader>dh', '<cmd>Telescope dap commands<cr>')
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
keymap.set("n", '<leader>di', function() require "dap.ui.widgets".hover() end)
keymap.set("n", '<leader>de', function() require('telescope.builtin').diagnostics({ default_text = ":E:" }) end)

keymap.set("n", '<leader>dd',
  function()
    require('dap').disconnect(); require('dapui').close();
  end
)

keymap.set("n", '<leader>dt',
  function()
    require('dap').terminate(); require('dapui').close();
  end
)

keymap.set("n", '<leader>d?',
  function()
    local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes)
  end
)
