return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",

    "leoluz/nvim-dap-go",
    "julianolf/nvim-dap-lldb",
    "mxsdev/nvim-dap-vscode-js",
  },

  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()
    require("dap-go").setup()

    --TODO esta faltando a localização do executavel lldb
    require("dap-lldb").setup() -- C/C++, rust

    --TODO configurar melhor plugin (config default)
    require("dap-vscode-js").setup({
      adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
    })

    --TODO falta o dap do java,lua,shellscript

    for _, language in ipairs({ "typescript", "javascript" }) do
      dap.configurations[language] = {}
    end

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.after.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.after.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}
