local Terminal = require("toggleterm.terminal").Terminal

local quick_command = Terminal:new({
	cmd = "",
	direction = "float",
	close_on_exit = false,
	hidden = true,
})

local function _toggle_quick_command()
	if quick_command:is_open() then
		quick_command:toggle()
	else
		vim.ui.input({ prompt = "Comando: " }, function(input)
			if input then
				quick_command.cmd = input
				quick_command:toggle()
			end
		end)
	end
end

local function _rerun_last_command()
	if quick_command.cmd ~= "" then
		quick_command:toggle()
	else
		vim.notify("Nenhum comando executado ainda!", vim.log.levels.WARN)
	end
end
return {
	{ "<leader>ce", _toggle_quick_command, { desc = "Abrir/Minimizar terminal" } },
	{ "<leader>cr", _rerun_last_command,   { desc = "Reexecutar último comando" } },
}
