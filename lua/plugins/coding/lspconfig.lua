return {
  "neovim/nvim-lspconfig",
  cmd = { "LspInfo", "LspInstall", "LspStart" },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
    capabilities.textDocument.completion.completionItem.snippetSupport = false

    require("mason-lspconfig").setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
        })
      end,

      ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup({
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
      ["gopls"] = function()
        require("lspconfig").gopls.setup({
          settings = {
            gopls = {
              completeUnimported = true,
              usePlaceholders = true,
              analyses = {
                unusedparams = true,
              }
            }
          }
        })
      end
    })
    vim.api.nvim_create_autocmd('LspAttach', require("custom.lsp-mapping"))
  end,
}
