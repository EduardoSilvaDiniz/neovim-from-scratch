return {
	"CRAG666/code_runner.nvim",
	config = function()
		require("code_runner").setup({
			filetype = {
				java = {
					"cd $dir &&",
					"javac $fileName &&",
					"java $fileNameWithoutExt",
				},
				python = "python3 -u",
				typescript = "deno run",
				rust = {
					"cd $dir &&",
					"rustc $fileName &&",
					"$dir/$fileNameWithoutExt",
				},
				c = function()
					local c_base = {
						"cd $dir &&",
						"gcc $fileName -o",
						"/tmp/$fileNameWithoutExt",
					}
					local c_exec = {
						"&& /tmp/$fileNameWithoutExt &&",
						"rm /tmp/$fileNameWithoutExt",
					}
					vim.ui.input({ prompt = "Add more args:" }, function(input)
						c_base[4] = input
						vim.print(vim.tbl_extend("force", c_base, c_exec))
						require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
					end)
				end,
				cpp = function()
					-- Função para esperar a entrada do usuário antes de fechar o buffer
					local function wait_and_close_buffer()
						-- Solicitar a entrada do usuário
						vim.ui.input({}, function()
							-- Fechar o buffer atual
							vim.cmd("bd") -- 'bd' é o comando para fechar o buffer atual
						end)
					end
					vim.api.nvim_create_user_command("WaitAndCloseBuffer", wait_and_close_buffer, {})

					-- Definir um comando do Neovim para usar a função
					local project_root = vim.fn.getcwd()
					local output = "/tmp/$file"
					local cpp_base = {
						"cd " .. project_root,
						" && ",
						"cmake",
						"-B " .. output,
						" && ",
						"make",
						"-C " .. output,
					}
					local cpp_exec = {
						"&& " .. output .. "/main",
						" && ",
						"rm -rf " .. "/tmp/$file",
					}

					require("code_runner.commands").run_from_fn(vim.list_extend(cpp_base, cpp_exec))
					vim.cmd('silent! wincmd w | if &buftype ==# "terminal" | q | endif')
				end,
			},
		})
	end,
}
