local function findFiles()
  local status, files = pcall(io.popen, 'find "$HOME"/.config/nvim/lua/' .. "plugins" .. " -type f")
  if not status then
    vim.print("The find command could not be executed")
  end

  return files
end

local function clearPath(filePath)
  return filePath:gmatch("%/lua%/(.+).lua$")({ 0 }):gsub("/", ".")
end

local function tableFactory()
  local pluginsTable = {}
  local files = findFiles()

  for file in files:lines() do
    if not string.find(file, "init") then
      local pluginPath = clearPath(file)
      --local objPlugin = require(pluginPath)
      local status, objPlugin = pcall(require, pluginPath)
      if not status then
        vim.print("not found plugin " .. pluginPath)
      end

      table.insert(pluginsTable, objPlugin)
    end
  end
  return pluginsTable
end

return tableFactory()
