local lfs = require("lfs")

local function listFilesInDir(dir)
  if not lfs.attributes(dir, "mode") == "directory" then
    print(dir .. " não é um diretório válido.")
    return
  end

  for file in lfs.dir(dir) do
    if file ~= "." and file ~= ".." and file ~= "autoload.lua" then
      local fullPath = dir .. "/" .. file
      local attr = lfs.attributes(fullPath)

      if attr.mode == "directory" then
        listFilesInDir(fullPath)
      elseif attr.mode == "file" then
        local var = fullPath:gsub("/", "."):sub(28)
        print(var)
      end
    end
  end
end

local rootDir = "/home/edu/.config/nvim/lua/plugins"
listFilesInDir(rootDir)
