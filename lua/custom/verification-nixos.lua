M = {}

local function executar_comando(comando)
  return vim.fn.system(comando):gsub("%s+", "")
end

function M.verificationIsNotNix()
  local resultado_nome = executar_comando("grep '^NAME=' /etc/os-release")

  if resultado_nome ~= "NAME=NixOS" then
    return true
  else
    return false
  end
end

return M
