local servers = {
  -- LSPs
  "html-lsp",                   -- HTML
  "css-lsp",                    -- CSS
  "typescript-language-server", -- JavaScript/TypeScript
  "gopls",                      -- Go
  "clangd",                     -- C/C++
  "jdtls",                      -- Java
  "intelephense",               -- php
  "lua-language-server",        -- Lua

  -- DAP
  "js-debug-adapter",   -- JavaScript/TypeScript
  "delve",              -- Go
  "cpptools",           -- C/C++
  "java-debug-adapter", -- java
  "java-test",          -- Java
  "php-debug-adapter",  -- PHP

  -- Linters
  "eslint_d",      -- JavaScript/TypeScript
  "golangci-lint", -- Go
  "checkstyle",    -- Java
  "phpcs",         -- PHP
  "luacheck",      -- lua

  -- Formatters
  "prettierd",          -- JavaScript/TypeScript, HTML, CSS
  "goimports",          -- Go
  "gofumpt",            -- Go
  "google-java-format", -- Java
  "phpcbf",             -- PHP
  "stylua",             -- Lua
}
return servers
