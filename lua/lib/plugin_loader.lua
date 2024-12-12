local M = {}
function M.createTable(pathList)
  local plugins = {}

  for _, path in pairs(pathList) do
    local status, plugin = pcall(require, path)
    if not status then
      vim.print("not found plugin " .. path)
    end
    table.insert(plugins, plugin)
  end

  return plugins
end

function M.createList(list, filter)
  local newList = {}

  for element in list:lines() do
    element = M.clearElement(element)

    if M.filter(element, filter) then
      table.insert(newList, element)
    end
  end

  return newList
end

function M.findFiles(dir)
  local status, files = pcall(io.popen, 'find "$HOME"/.config/nvim/lua/' .. dir .. " -type f")

  if not status then
    vim.print("The find command could not be executed")
  end

  return files
end

function M.filter(element, filter)
  for _, key in pairs(filter) do
    if string.find(element, key) then
      return false
    end
  end

  return true
end

function M.clearElement(element)
  return element:gmatch("%/lua%/(.+).lua$")({ 0 }):gsub("/", ".")
end

return M
