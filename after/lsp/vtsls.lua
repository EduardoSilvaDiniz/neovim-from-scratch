local vue_language_server_path = vim.fn.stdpath('data') .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}
local capabilities = require('blink.cmp').get_lsp_capabilities()
return {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
    -- desativa semantic tokens
    client.server_capabilities.semanticTokensProvider = nil
  end,
  settings = {
		typescript = {
      semanticTokens = false,
    },
    javascript = {
      semanticTokens = false,
    },
    vtsls = {
      semanticTokens = false,
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
}
