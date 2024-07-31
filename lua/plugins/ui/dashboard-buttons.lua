M = {}

function M.findFiles() end

function M.openNewFile()
  return function() end
end

function M.findRecentFiles()
  return function() end
end

function M.listProjects()
  return function() end
end

function M.restoreSession()
  return function() end
end

function M.findConfigFiles()
  local builtin = require("telescope.builtin")

  return function()
    builtin.find_files({ cwd = vim.fn.stdpath("config") })
  end
end

function M.quitVim()
  return function()
    vim.api.nvim_input("<cmd>qa<cr>")
  end
end

function M.configFooter()
  local stats = require("lazy").stats()
  local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

  return function()
    return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
  end
end

return M
