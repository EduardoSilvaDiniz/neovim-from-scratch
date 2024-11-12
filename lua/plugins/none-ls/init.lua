return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- C/C++, C#, Java
        null_ls.builtins.formatting.uncrustify,

        -- Go, Javascript, Lua, Python, Typescript
        null_ls.builtins.code_actions.refactoring,

        -- C/C++
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.diagnostics.cppcheck,
        null_ls.builtins.diagnostics.gccdiag,

        -- Clojure
        null_ls.builtins.diagnostics.clj_kondo,

        -- Dart
        null_ls.builtins.formatting.dart_format,

        -- Docker
        null_ls.builtins.diagnostics.hadolint,

        -- Editorconfig
        null_ls.builtins.diagnostics.editorconfig_checker,

        -- Gradle
        null_ls.builtins.diagnostics.npm_groovy_lint,

        -- Java
        null_ls.builtins.formatting.google_java_format,
        null_ls.builtins.diagnostics.checkstyle,
        null_ls.builtins.diagnostics.pmd,

        -- Javascript
        null_ls.builtins.formatting.prettier,

        -- Go
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.code_actions.gomodifytags,
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.diagnostics.revive,

        -- Spell
        null_ls.builtins.completion.spell,

        -- Make
        null_ls.builtins.diagnostics.checkmake,
        null_ls.builtins.diagnostics.cmake_lint,

        -- Nix
        null_ls.builtins.formatting.alejandra,
        null_ls.builtins.code_actions.statix,
        null_ls.builtins.diagnostics.deadnix,

        -- PHP
        null_ls.builtins.formatting.phpcbf,
        null_ls.builtins.diagnostics.phpcs,
        null_ls.builtins.diagnostics.phpmd,
        null_ls.builtins.diagnostics.phpstan,
        null_ls.builtins.formatting.phpcsfixer,
        null_ls.builtins.formatting.pretty_php,

        -- Python
        null_ls.builtins.diagnostics.pylint.with({
          diagnostics_postprocess = function(diagnostic)
            diagnostic.code = diagnostic.message_id
          end,
        }),
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,

        -- Lua
        null_ls.builtins.formatting.stylua,

        -- Xml
        null_ls.builtins.diagnostics.tidy,
      },
    })
  end,
}
