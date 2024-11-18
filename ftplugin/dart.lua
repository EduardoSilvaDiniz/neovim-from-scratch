local keymap = vim.keymap

keymap.set("n", "<leader>cf", "<cmd>FlutterRun<cr>", { desc = "Run Flutter Project" })
keymap.set("n", "<leader>cr", require("dart-lsp-refactorings").rename, { desc = "LSP Rename" })

