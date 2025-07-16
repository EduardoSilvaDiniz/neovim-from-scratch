local width = math.floor(vim.api.nvim_win_get_width(0) / 2.5)

return {
	menu = {
		width = width
	},
	settings = {
		save_on_toggle = true,
	},
}
