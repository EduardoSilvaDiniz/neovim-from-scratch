local ts = require("nvim-treesitter")
local tsConfig = require("nvim-treesitter.configs")

ts.setup()
tsConfig.setup({
	ensure_installed = "",
	sync_install = true,
	auto_install = true,
	TSUpdate = true,
	ignore_install = {},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = true,
	},
	modules = {},
	parser_install_dir = nil,
})

-- require("treesitter-context").setup({
-- 	enable = true,
-- 	max_lines = 0,
-- 	min_window_height = 0,
-- 	line_numbers = true,
-- 	multiline_threshold = 20,
-- 	trim_scope = "outer",
-- 	mode = "cursor",
-- 	separator = nil,
-- 	zindex = 20,
-- 	on_attach = nil,
-- })
