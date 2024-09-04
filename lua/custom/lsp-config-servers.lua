local lspconfig = require("lspconfig")
local function extendCapabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = false
	capabilities.textDocument.signatureHelp.dynamicRegistration = false

	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
	return capabilities
end

M = {
	lua = function()
		lspconfig.lua_ls.setup({
			capabilities = extendCapabilities(),
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
			capabilities = extendCapabilities(),
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
		lspconfig.markdown_oxide.setup({
			capabilities = extendCapabilities(),
		})
	end,

	c_cpp = function()
		lspconfig.clangd.setup({
			capabilities = extendCapabilities(),
		})
	end,

	nix = function()
		lspconfig.nil_ls.setup({
			capabilities = extendCapabilities(),
		})
	end,

	python = function()
		lspconfig.pyright.setup({
			capabilities = extendCapabilities(),
		})
	end,

	bash = function()
		lspconfig.bashls.setup({
			capabilities = extendCapabilities(),
		})
	end,

	php = function()
		lspconfig.intelephense.setup({
			capabilities = extendCapabilities(),
		})
	end,

	html = function()
		lspconfig.html.setup({
			capabilities = extendCapabilities(),
		})
	end,

	css = function()
		lspconfig.cssls.setup({
			capabilities = extendCapabilities(),
		})
	end,

	js_typescript = function()
		lspconfig.eslint.setup({
			capabilities = extendCapabilities(),
		})
	end,

	json = function()
		lspconfig.jsonls.setup({
			capabilities = extendCapabilities(),
		})
	end,
}

return M
