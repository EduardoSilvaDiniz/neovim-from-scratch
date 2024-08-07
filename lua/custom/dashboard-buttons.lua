CmpConfig = {}

function CmpConfig.findFiles() end

function CmpConfig.openNewFile()
  return function() end
end

function CmpConfig.findRecentFiles()
  return function() end
end

function CmpConfig.listProjects()
  return function() end
end

function CmpConfig.restoreSession()
  return function() end
end

function CmpConfig.findConfigFiles()
  local builtin = require("telescope.builtin")

  return function()
    builtin.find_files({ cwd = vim.fn.stdpath("config") })
  end
end

function CmpConfig.quitVim()
  return function()
    vim.api.nvim_input("<cmd>qa<cr>")
  end
end

function CmpConfig.configFooter()
  local stats = require("lazy").stats()
  local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

  return function()
    return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
  end
end

return CmpConfig
