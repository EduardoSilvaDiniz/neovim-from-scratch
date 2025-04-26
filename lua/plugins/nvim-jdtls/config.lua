---@diagnostic disable: unused-local
local function get_jdtls()
	local mason_registry = require("mason-registry")
	local jdtls = mason_registry.get_package("jdtls")
	local jdtls_path = jdtls:get_install_path()
	local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
	local SYSTEM = "linux"
	local config = jdtls_path .. "/config_" .. SYSTEM
	local lombok = jdtls_path .. "/lombok.jar"
	return launcher, config, lombok
end

local function get_bundles()
	local mason_registry = require("mason-registry")
	local java_debug = mason_registry.get_package("java-debug-adapter")
	local java_debug_path = java_debug:get_install_path()

	local bundles = {
		vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", true),
	}

	local java_test = mason_registry.get_package("java-test")
	local java_test_path = java_test:get_install_path()
	vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar", true), "\n"))

	return bundles
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = "/home/edu/workspace-root/" .. project_name

local jdtls, os_config, lombok = get_jdtls()
local bundles = get_bundles()
local capabilities = require("lib.capabilities")
local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

return {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"-Duser.language=pt",
		"-Duser.region=BR",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-javaagent:" .. lombok,
		"-jar",
		jdtls,
		"-configuration",
		os_config,
		"-data",
		workspace_dir,
	},

	root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),

	settings = {
		java = {
			format = {
				enabled = false,
			},
			-- Enable downloading archives from eclipse automatically
			eclipse = {
				downloadSource = true,
			},
			-- Enable downloading archives from maven automatically
			maven = {
				downloadSources = true,
			},
			-- Enable method signature help
			signatureHelp = {
				enabled = true,
			},
			-- Use the fernflower decompiler when using the javap command to decompile byte code back to java code
			contentProvider = {
				preferred = "fernflower",
			},
			-- Setup automatical package import oranization on file save
			saveActions = {
				organizeImports = true,
			},
			-- Customize completion options
			completion = {
				-- When using an unimported static method, how should the LSP rank possible places to import the static method from
				favoriteStaticMembers = {
					"org.hamcrest.MatcherAssert.assertThat",
					"org.hamcrest.Matchers.*",
					"org.hamcrest.CoreMatchers.*",
					"org.junit.jupiter.api.Assertions.*",
					"java.util.Objects.requireNonNull",
					"java.util.Objects.requireNonNullElse",
					"org.mockito.Mockito.*",
				},
				-- Try not to suggest imports from these packages in the code action window
				filteredTypes = {
					"com.sun.*",
					"io.micrometer.shaded.*",
					"java.awt.*",
					"jdk.*",
					"sun.*",
				},
				-- Set the order in which the language server should organize imports
				importOrder = {
					"java",
					"jakarta",
					"javax",
					"com",
					"org",
				},
			},
			sources = {
				-- How many classes from a specific package should be imported before automatic imports combine them all into a single import
				organizeImports = {
					starThreshold = 9999,
					staticThreshold = 9999,
				},
			},
			-- How should different pieces of code be generated?
			codeGeneration = {
				-- When generating toString use a json format
				toString = {
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
				},
				-- When generating hashCode and equals methods use the java 7 objects method
				hashCodeEquals = {
					useJava7Objects = true,
				},
				-- When generating code use code blocks
				useBlocks = true,
			},
			-- If changes to the project will require the developer to update the projects configuration advise the developer before accepting the change
			configuration = {
				updateBuildConfiguration = "interactive",
			},
			-- enable code lens in the lsp
			referencesCodeLens = {
				enabled = true,
			},
			-- enable inlay hints for parameter names,
			inlayHints = {
				parameterNames = {
					enabled = "all",
				},
			},
		},
	},

	capabilities = capabilities,

	init_options = {
		bundles = bundles,
		extendedClientCapabilities = extendedClientCapabilities,
	},

	on_attach = function(_, bufnr)
		require("jdtls.dap").setup_dap()
		require("jdtls.dap").setup_dap_main_class_configs()
		require("jdtls.setup").add_commands()
		vim.lsp.codelens.refresh()
		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = { "*.java" },
			callback = function()
				local _, _ = pcall(vim.lsp.codelens.refresh)
			end,
		})
	end,
}
