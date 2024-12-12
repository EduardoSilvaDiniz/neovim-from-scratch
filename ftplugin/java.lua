local home = vim.env.HOME

local jdtls = require("jdtls")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/jdtls-workspace/" .. project_name


local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ERROR",

    "-javaagent:" .. require("lib.nixUtils").getLspPath("lombok"),

    "-Xmx4g",

    "--add-modules=ALL-SYSTEM",

    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",

    "-jar",
    require("lib.nixUtils").getLspPath("jdtls")
    .. "/share/java/jdtls/features/org.eclipse.equinox.executable_*.jar",

    "-configuration",
    require("lib.nixUtils").getLspPath("jdtls") .. "/share/java/jdtls/config_linux",

    "-data",
    workspace_dir,
},


  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "pom.xml", "build.gradle" }),

  settings = {
    java = {
      home = require("lib.nixUtils").getLspPath("openjdk_legacy"),
      eclipse = {
        downloadSources = false,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "OpenJDK-11",
            path = require("lib.nixUtils").getLspPath("openjdk_legacy"),
          },
          {
            name = "OpenJDK-21",
            path = require("lib.nixUtils").getLspPath("openjdk_lts"),
          },
        },
      },
      maven = {
        downloadSources = false,
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
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  flags = {
    allow_incremental_sync = true,
  },
}

jdtls.start_or_attach(config)
