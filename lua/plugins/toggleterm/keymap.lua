local Terminal = require("toggleterm.terminal").Terminal

local quick_command = Terminal:new({
	cmd = "",
	direction = "float",
	close_on_exit = false,
	hidden = true,
})

local function get_focus()
	vim.defer_fn(function()
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)
		vim.api.nvim_set_current_win(vim.fn.win_getid())
	end, 100)
end

--- abre um caixa de entrada para digitar um comando que será executando em um terminal
--- caso o terminal já esteja aberto, será fechando e aberto outro
local function run_command_terminal()
	quick_command:shutdown()
	vim.ui.input({ prompt = "Comando: " }, function(input)
		if not input or input == "" then
			vim.api.nvim_echo({ { "Por favor, forneça um comando para o terminal.", "WaringMsg" }, }, false, { err = true })
			return
		end

		quick_command.cmd = input
		quick_command:toggle()
		get_focus()
		vim.api.nvim_buf_set_keymap(0, "n", "Q", ":q!<CR>", { noremap = true, silent = true })
	end)
end

--- altera o estado do terminal de minimizado e maximizado
--- caso o terminal esteja fechando, ele executa com o ultimo comando
local function toggle_terminal()
	if quick_command.cmd == "" then
		vim.api.nvim_echo({ { "Por favor, forneça um comando para o terminal.", "WaringMsg" }, }, false, { err = true })
		return
	end
	quick_command:toggle()
	get_focus()
	vim.api.nvim_buf_set_keymap(0, "n", "Q", ":q!<CR>", { noremap = true, silent = true })
end

local function shutdown_terminal()
	quick_command:shutdown()
end

return {
	{ "<leader>ce", run_command_terminal, { desc = "executar comando no terminal" } },
	{ "<leader>tt", toggle_terminal,      { desc = "altera terminal" } },
	{ "<leader>tc", shutdown_terminal,    { desc = "fecha o terminal" } },
}
