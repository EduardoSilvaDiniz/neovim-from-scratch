-- TODO APAGUE CODIGOS DESNECESSARIOS
-- TODO FAÇA COM QUE CMAKE MAKE E RUN BUILD RODE DE UMA VEZ SÓ
-- TODO ARRUME A SAIDA DO CODIGO
local function open_and_close()
	local overseer = require("overseer")

	overseer.toggle({ enter = false })

	-- Close it after 10 seconds (if not inside the window).
	vim.defer_fn(function()
		if vim.bo.filetype ~= "OverseerList" then
			overseer.close()
		end
	end, 10 * 1000)
end

return {
	"stevearc/overseer.nvim",
	config = function()
		require("overseer").setup({
			dap = false,
			templates = {
				"user.cmake",
				"user.make",
				"user.run_build",
				"user.run_script",
			},
			task_list = {
				default_detail = 2,
				direction = "bottom",
				max_width = { 600, 0.7 },
				bindings = {
					["<C-b>"] = "ScrollOutputUp",
					["<C-f>"] = "ScrollOutputDown",
					["H"] = "IncreaseAllDetail",
					["L"] = "DecreaseAllDetail",
					-- Disable mappings I don't use.
					["g?"] = false,
					["<C-l>"] = false,
					["<C-h>"] = false,
					["{"] = false,
					["}"] = false,
				},
			},
			form = {
				win_opts = { winblend = 0 },
			},
			confirm = {
				win_opts = { winblend = 5 },
			},
			task_win = {
				win_opts = { winblend = 5 },
			},
		})

		vim.api.nvim_create_user_command("WatchRun", function()
			local overseer = require("overseer")
			overseer.run_template({ name = "run script" }, function(task)
				if task then
					task:add_component({ "restart_on_save", paths = { vim.fn.expand("%:p") } })
					local main_win = vim.api.nvim_get_current_win()
					overseer.run_action(task, "open vsplit")
					vim.api.nvim_set_current_win(main_win)
				else
					vim.notify("WatchRun not supported for filetype " .. vim.bo.filetype, vim.log.levels.ERROR)
				end
			end)
		end, {})
	end,

	keys = {
		{ "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle task window" },
		{
			"<leader>o<",
			function()
				local overseer = require("overseer")

				local tasks = overseer.list_tasks({ recent_first = true })
				if vim.tbl_isempty(tasks) then
					vim.notify("No tasks found", vim.log.levels.WARN)
				else
					overseer.run_action(tasks[1], "restart")
					open_and_close()
				end
			end,
			desc = "Restart last task",
		},
		{
			"<leader>or",
			function()
				require("overseer").run_template({}, function(task)
					if task then
						open_and_close()
					end
				end)
			end,
			desc = "Run task",
		},
	},
}
