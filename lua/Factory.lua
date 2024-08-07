Factory = {}
Factory.__index = Factory

-- Método construtor
function Factory:new(type, plugin)
  self = setmetatable({}, Factory)                 -- Cria um novo objeto com a metatable `Actions`
  local objPlugin = require(type .. "." .. plugin) -- Carrega o módulo específico para o `action`

  -- Verifica se o módulo foi carregado corretamente
  if type(objPlugin) ~= "table" then
    error("O módulo '" .. plugin .. "' não retornou uma tabela.")
  end

  -- Define a metatable do objeto para o plugin carregado
  setmetatable(self, { __index = objPlugin })

  return self
end

return Factory
