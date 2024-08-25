local lspconfig = require("lspconfig")
M = {
  lua = function()
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = {
              "vim",
              "require",
            },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })
  end,
  go = function()
    lspconfig.gopls.setup({
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
    })
  end,

  markdown = function()
    lspconfig.markdown_oxide.setup({})
  end,

  c_cpp = function()
    lspconfig.clangd.setup({})
  end,

  nix = function()
    lspconfig.nil_ls.setup({})
  end,

  python = function()
    lspconfig.pyright.setup({})
  end,

  bash = function()
    lspconfig.bashls.setup({})
  end,

  php = function()
    lspconfig.intelephense.setup({})
  end,

  html = function()
    lspconfig.html.setup({})
  end,

  css = function()
    lspconfig.cssls.setup({})
  end,

  js_typescript = function()
    lspconfig.eslint.setup({})
  end,

  json = function()
    lspconfig.jsonls.setup({})
  end,
}

return M
