return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"jay-babu/mason-nvim-dap.nvim",
	},
	keys = {
		{
			"<leader>db",
			"<cmd>DapToggleBreakpoint<cr>",
			desc = "Add breakpoint at line",
		},
		{
			"<leader>dr",
			"<cmd>DapContinue<cr>",
			desc = "start or continue the debugger",
		},
	},
	config = function()
		local dap = require("dap")
		dap.adapters.cppdbg = {
			id = "cppdbg",
			type = "executable",
			command = "",
			options = {
				detached = false,
			},
		}
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "cppdbg",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtEntry = true,
			},
			{
				name = "Attach to gdbserver :1234",
				type = "cppdbg",
				request = "launch",
				MIMode = "gdb",
				miDebuggerServerAddress = "localhost:1234",
				miDebuggerPath = "/usr/bin/gdb",
				cwd = "${workspaceFolder}",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
			},
		}
	end,
}
