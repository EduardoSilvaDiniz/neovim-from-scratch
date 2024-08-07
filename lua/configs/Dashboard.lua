Dashboard = {}

function Dashboard.findFiles() end

function Dashboard.openNewFile()
  return function() end
end

function Dashboard.findRecentFiles()
  return function() end
end

function Dashboard.listProjects()
  return function() end
end

function Dashboard.restoreSession()
  return function() end
end

function Dashboard.findConfigFiles()
  local builtin = require("telescope.builtin")

  return function()
    builtin.find_files({ cwd = vim.fn.stdpath("config") })
  end
end

function Dashboard.quitVim()
  return function()
    vim.api.nvim_input("<cmd>qa<cr>")
  end
end

function Dashboard.configFooter()
  local stats = require("lazy").stats()
  local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

  return function()
    return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
  end
end

return Dashboard
