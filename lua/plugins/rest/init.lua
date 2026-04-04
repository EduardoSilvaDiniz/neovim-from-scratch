if true then
	return {}
end
return {
	"rest-nvim/rest.nvim",
	dependencies = {
		"rest-nvim/tree-sitter-http",
	},
	keys = {
		{ "<leader>hh", "<cmd>Rest run<CR>", desc = "Executar requisição HTTP" },
		{ "<leader>hl", "<cmd>Rest run last<CR>", desc = "Reexecutar última requisição" },
	},
}
