local compilers = require("custom.compilers")
--local command = "<cmd>" .. "w | TermExec cmd='" .. compilers.compilerAndRun() .. ". " .. "; exit'" .. "<cr>"
return {
  'akinsho/toggleterm.nvim',
  version = "*",
  keys = {
    --{ "<leader>cr", "<cmd>w | TermExec cmd='g++ main.cpp && ./a.out && rm -rf ./a.out ; exit'<cr>",                          desc = "saving and compiler and run code on term" },

    --{ "<leader>cr", command, desc = "saving and compiler and run code on term" }
  },
}
