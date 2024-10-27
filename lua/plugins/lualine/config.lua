local lualine = require("lualine")
local trouble = require("trouble")

local colors = {
	bg = "#202328",
	fg = "#bbc2cf",
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

local config = {
	options = {
		component_separators = "",
		section_separators = "",
		max_length = vim.o.columns * 2 / 2,
		-- theme = require("lualine.themes.gruvbox"),
    options = { theme = 'gruvbox' }
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left({
	function()
		return "▏"
	end,
	color = { fg = "#282828" }, -- Sets highlighting of component
	padding = { left = 0, right = 1 }, -- We don't need space before this
})

ins_left({
	function()
		local mode_icon = {
			n = "󰰓",
			i = "󰰄",
			v = "󰰫",
			V = "󰰫",
			vb = "󰰫",
			c = "󰰖",
			no = "󰰖",
			s = "󰰢",
			S = "󰰢",
			ic = "󰰄",
			R = "󰰟",
			Rv = "󰰟",
			cv = "󰯲",
			ce = "󰯲",
			r = "󰰟",
			rm = "󰰟",
			t = "󰰥",

			["␖"] = "!",
			["␓"] = "!",
			["r?"] = "!",
			["!"] = "!",
		}
		return mode_icon[vim.fn.mode()]
	end,
	color = function()
		local mode_color = {
			n = colors.green,
			i = colors.blue,
			v = colors.yellow,
			["␖"] = colors.yellow,
			V = colors.yellow,
			c = colors.cyan,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			["␓"] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}
		return { bg = mode_color[vim.fn.mode()]}
	end,
	padding = { right = 1 },
})

ins_left({
	"filename",
	path = 1,
	cond = conditions.buffer_not_empty,
	color = { bg = "#ffffff", gui = "bold" },
})

ins_left({ "location", color = { bg = "#ffffff", gui = "bold" } })

ins_right({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " " },
	diagnostics_color = {
		error = { bg = colors.red },
		warn = { bg = colors.yellow, fg = nil},
		info = { bg = colors.cyan, fg = nil},
	},
})

ins_right({
	function()
		local msg = ""
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = "󱓟 ",
	color = { fg = colors.blue, gui = "bold" },
})

ins_right({
	"branch",
	icon = "󰘬",
	color = { fg = colors.green, gui = "bold" },
})

ins_right({
	"diff",
	symbols = { added = "󰐙 ", modified = "󰝶 ", removed = "󰍷 " },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},
	cond = conditions.hide_in_width,
})

ins_right({
	function()
		return "▕"
	end,
	color = { fg = "#282828" }, -- Sets highlighting of component
	padding = { left = 1, right = 0 }, -- We don't need space before this
})

lualine.setup(config)
