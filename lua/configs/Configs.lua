Configs = {}
Configs.__index = Configs

function Configs:new(pluginName)
  --EXEMPLE cmpConfig = require("configs.cmp")
  self = setmetatable({}, Configs) -- Cria um novo objeto com a metatable `Actions`
  local plugin = require("configs." .. pluginName)

  if type(plugin) ~= "table" then
    error("O módulo '" .. pluginName .. "' não retornou uma tabela.")
  end

  setmetatable(self, { __index = plugin })
  return self
end

return Configs
