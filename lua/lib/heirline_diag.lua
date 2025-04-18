-- local utils = require("heirline.utils")
local conditions = require("heirline.conditions")
local hl = require("heirline.highlights")  -- Supondo que você tenha um módulo de highlights
local M = {}

local function build_provider(opts, provider, _)
  return opts
      and {
        provider = provider,
        opts = opts,
        condition = opts.condition,
        on_click = opts.on_click,
        update = opts.update,
        hl = opts.hl,
      }
      or false
end

local function setup_providers(opts, providers, setup)
  setup = setup or build_provider
  for i, provider in ipairs(providers) do
    opts[i] = setup(opts[provider], provider, i)
  end
  return opts
end


function M.diagnostics(opts)
  opts = vim.tbl_deep_extend("force", {
    ERROR = {
      icon = { kind = "DiagnosticError", padding = { left = 1, right = 1 } },
    },
    WARN = {
      icon = { kind = "DiagnosticWarn", padding = { left = 1, right = 1 } },
    },
    INFO = {
      icon = { kind = "DiagnosticInfo", padding = { left = 1, right = 1 } },
    },
    HINT = {
      icon = { kind = "DiagnosticHint", padding = { left = 1, right = 1 } },
    },
    surround = {
      separator = "left",
      color = "diagnostics_bg",
      condition = conditions.has_diagnostics,
    },
    -- hl = hl.get_attributes("diagnostics"),
    on_click = {
      name = "heirline_diagnostic",
      callback = function()
        if vim.fn.exists("telescope.nvim") == 1 then
          require("telescope.builtin").diagnostics()
        end
      end,
    },
    update = { "DiagnosticChanged", "BufEnter" },  -- Atualiza nos eventos corretos
  }, opts)

  return M.builder(
    setup_providers(
      opts,
      { "ERROR", "WARN", "INFO", "HINT" },
      function(p_opts, p)
        local out = build_provider(p_opts, p)
        if out then
          out.provider = "diagnostics"
          out.opts.severity = p
          if out.hl == nil then
            out.hl = { fg = "diag_" .. p }  -- Atribui a cor dinâmica
          end
        end
        return out
      end
    )
  )
end

return M

