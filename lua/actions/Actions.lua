-- actions/Actions.lua
local Actions = {}
Actions.__index = Actions

-- Método construtor
function Actions:new(action)
  self = setmetatable({}, Actions)             -- Cria um novo objeto com a metatable `Actions`
  local plugin = require("actions." .. action) -- Carrega o módulo específico para o `action`

  -- Verifica se o módulo foi carregado corretamente
  if type(plugin) ~= "table" then
    error("O módulo '" .. action .. "' não retornou uma tabela.")
  end

  -- Define a metatable do objeto para o plugin carregado
  setmetatable(self, { __index = plugin })

  return self
end

return Actions
