local keymap = vim.keymap.set
require('code_runner').setup({
  filetype = {
    java = {
      "cd $dir &&",
      "javac $fileName &&",
      "java $fileNameWithoutExt"
    },
    python = "python3 -u",
    typescript = "deno run",
    rust = {
      "cd $dir &&",
      "rustc $fileName &&",
      "$dir/$fileNameWithoutExt"
    },
    c = function(...)
      c_base = {
        "cd $dir &&",
        "gcc $fileName -o",
        "/tmp/$fileNameWithoutExt",
      }
      local c_exec = {
        "&& /tmp/$fileNameWithoutExt &&",
        "rm /tmp/$fileNameWithoutExt",
      }
      vim.ui.input({ prompt = "Add more args:" }, function(input)
        c_base[4] = input
        vim.print(vim.tbl_extend("force", c_base, c_exec))
        require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
      end)
    end,
  },
})

keymap('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })
keymap('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
keymap('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
keymap('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
keymap('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
keymap('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
keymap('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
