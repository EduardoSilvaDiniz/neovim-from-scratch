local M = {}

local tableNames = {
  jdtls = {
    nix_package = "jdt-language-server",
    extra_path = "",
  },
  lombok = {
    nix_package = "lombok",
    extra_path = "/share/java/lombok.jar",
  },
  openjdk_lts = {
    nix_package = "openjdk",
    extra_path = "",
  },
  openjdk_legacy = {
    nix_package = "openjdk11",
    extra_path = "",
  },
}

function M.getLspPath(lspName)
  local lspInfo = tableNames[lspName]
  if not lspInfo then
    log("Lsp não encontrando na tabela: " .. lspName)
    return nil
  end

  local nixCommand = "nix eval nixpkgs#" .. lspInfo.nix_package .. ".outPath --raw"
  local handle = io.popen(nixCommand)
  local result = handle:read("*a")
  handle:close()

  if result and result ~= "" then
    local basePath = result:match("^%s*(.-)%s*$")
    return basePath .. lspInfo.extra_path
  end

  return nil
end

return M
