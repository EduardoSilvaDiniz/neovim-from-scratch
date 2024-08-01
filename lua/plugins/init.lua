local factoryTable = {}
local files = io.popen('find "$HOME"/.config/nvim/lua/' .. "plugins" .. " -type f")

for file in files:lines() do
  if not string.find(file, "init") then
    local req_file = file:gmatch("%/lua%/(.+).lua$")({ 0 }):gsub("/", ".")
    local plugin = require(req_file)
    table.insert(factoryTable, plugin)
  end
end

return factoryTable
