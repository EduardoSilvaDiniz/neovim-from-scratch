local M = {}
local builtin = require("telescope.builtin")

function M.builtinFindFilesConfig()
  return function()
    builtin.find_files({ cwd = vim.fn.stdpath("config") })
  end
end

function M.searchinOpenFiles()
  return function()
    builtin.live_grep({ grep_open_files = true, prompt_title = "Live Grep in Open Files" })
  end
end

return M
