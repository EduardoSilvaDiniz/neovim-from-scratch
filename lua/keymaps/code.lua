local keymap = vim.keymap
local builtin = require("telescope.builtin")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or "n"
      keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
    end

    map("<leader>ca", vim.lsp.buf.code_action, "Lsp Execute code action")


    map("<leader>cd", builtin.lsp_definitions, "Jump to definition")
    map("<leader>cD", builtin.lsp_references, "Jump to references")


    map("<leader>f", vim.lsp.buf.format, "Format buffer")
    map("<leader>ci", builtin.lsp_implementations, "Find implementations")
    map("<leader>cj", builtin.lsp_document_symbols, "Jump to symbol in current")
    map("<leader>cJ", builtin.lsp_dynamic_workspace_symbols, "Jump to symbol in any workspace")
    map("<leader>ck", builtin.lsp_document_symbols, "Jump to decumentation")

    map("<leader>co", function()
      if vim.bo.filetype == "c" or vim.bo.filetype == "cpp" then
        vim.lsp.buf.code_action({
          ---@diagnostic disable-next-line: missing-fields
          context = { only = { "quickfix" } },
          apply = true,
        })
      else
        vim.lsp.buf.code_action({
          ---@diagnostic disable-next-line: missing-fields
          context = { only = { "source.organizeImports" } },
          apply = true,
        })
      end
    end, "LSP Organize imports")

    map("<leader>cr", vim.lsp.buf.rename, "LSP Rename")


    map("<leader>cS", builtin.lsp_dynamic_workspace_symbols, "Symbols")
    map("<leader>ct", builtin.lsp_type_definitions, "Find type definition")


    map("<leader>cx", builtin.diagnostics, "List errors")

  end,
})
