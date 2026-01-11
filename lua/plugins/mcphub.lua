return {
	"ravitemer/mcphub.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
	opts = {
		extensions = {
			avante = {
				make_slash_commands = true,
			},
		},
		servers = {
			laravel = {
				url = "http://127.0.0.1:9000",
			},
		},
	},
}
