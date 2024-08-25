M = {}

local compilers = {
  ["c"] = "gcc ",
  ["cpp"] = "g++ ",
  ["java"] = "./gradlew compiler && ./gradlew run",
  ["go"] = "go run ",
  ["lua"] = "lua ",
  ["js"] = "nodejs ",
}


function M.compilerAndRun()
  vim.cmd [[
augroup FileTypeSettings
    autocmd!
    autocmd BufEnter * lua if vim.bo.filetype == 'go' then return "go run" end
augroup END
]]
end

return M
