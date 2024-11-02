local home = vim.env.HOME

local jdtls = require("jdtls")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/jdtls-workspace/" .. project_name
local system_os = "linux"

-- Needed for debugging
local bundles = {
	"/nix/store/vl5xzm8xr3isfx887zwqn4zi5d4f91c0-vscode-extension-vscjava-vscode-java-debug-0.55.2023121302/share/vscode/extensions/vscjava.vscode-java-debug/server/com.microsoft.java.debug.plugin-0.50.0.jar",
}
-- Needed for running/debugging unit tests
vim.list_extend(
	bundles,
	vim.split(
		vim.fn.glob(
			"/nix/store/agymid7m6g35lh0bwdv1qcx22zwh6clc-vscode-extension-vscjava-vscode-java-test-0.40.2024011806/share/vscode/extensions/vscjava.vscode-java-test/server/*.jar",
			1
		),
		"\n"
	)
)

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
	-- The command that starts the language server
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-javaagent:" .. "/nix/store/jlvq2x356ig01w1kp84648s6hsz9b5fz-lombok-1.18.32/share/java/lombok.jar",
		"-Xmx4g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		-- Eclipse jdtls location
		"-jar",
		home .. "/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher.jar",
		"-configuration",
		home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. system_os,
		"-data",
		workspace_dir,
	},

	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "pom.xml", "build.gradle" }),

	settings = {
		java = {
			home = "/nix/store/h8f0psz00bwjqqvbing2436h3g5rkk4d-openjdk-21.0.3+9",
			eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = "interactive",
				runtimes = {
					{
						name = "OpenJDK-8",
						path = "/nix/store/7xmm94w43s0qld3pq5ghx8mlyl4g8lk5-openjdk-8u362-ga",
					},
					{
						name = "OpenJDK-11",
						path = "/nix/store/ybx3vzikjkn8g5ig5vl2ynn2pq8yb998-openjdk-11.0.23+9",
					},
					{
						name = "OpenJDK-17",
						path = "/nix/store/fnnf6r9c903fzzf3n44ywxkgzs0xylc9-openjdk-17.0.7+7",
					},
					{
						name = "OpenJDK-21",
						path = "/nix/store/h8f0psz00bwjqqvbing2436h3g5rkk4d-openjdk-21.0.3+9",
					},
					{
						name = "OpenJDK-22",
						path = "/nix/store/3g3rddm9z1krfbcpl4dyj9vi61xb9k2l-openjdk-22+36",
					},
				},
			},
			maven = {
				downloadSources = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			signatureHelp = { enabled = true },
			format = {
				enabled = true,
				-- Formatting works by default, but you can refer to a specific file/URL if you choose
				-- settings = {
				--   url = "https://github.com/google/styleguide/blob/gh-pages/intellij-java-google-style.xml",
				--   profile = "GoogleStyle",
				-- },
			},
		},
		completion = {
			favoriteStaticMembers = {
				"org.hamcrest.MatcherAssert.assertThat",
				"org.hamcrest.Matchers.*",
				"org.hamcrest.CoreMatchers.*",
				"org.junit.jupiter.api.Assertions.*",
				"java.util.Objects.requireNonNull",
				"java.util.Objects.requireNonNullElse",
				"org.mockito.Mockito.*",
			},
			importOrder = {
				"java",
				"javax",
				"com",
				"org",
			},
		},
		extendedClientCapabilities = jdtls.extendedClientCapabilities,
		sources = {
			organizeImports = {
				starThreshold = 9999,
				staticStarThreshold = 9999,
			},
		},
		codeGeneration = {
			toString = {
				template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
			},
			useBlocks = true,
		},
	},
	-- Needed for auto-completion with method signatures and placeholders
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	flags = {
		allow_incremental_sync = true,
	},
	init_options = {
		-- References the bundles defined above to support Debugging and Unit Testing
		bundles = bundles,
	},
}

-- Needed for debugging
config["on_attach"] = function(client, bufnr)
	jdtls.setup_dap({ hotcodereplace = "auto" })
	require("jdtls.dap").setup_dap_main_class_configs()
end

-- This starts a new client & server, or attaches to an existing client & server based on the `root_dir`.
jdtls.start_or_attach(config)
