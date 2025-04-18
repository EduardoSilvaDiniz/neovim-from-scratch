local config = {
	options = {
		icons_enabled = false,
		component_separators = "",
		section_separators = "",
		theme = {
			normal = {
				c = { fg = "#ebdbb2", bg = "#282828" },
			},
			inactive = {
				c = { fg = "#ebdbb2", bg = "#282828" },
			},
		},
		disabled_filetypes = { "neo-tree" },
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

local function insert_left(component)
	table.insert(config.sections.lualine_c, component)
end

local function insert_right(component)
	table.insert(config.sections.lualine_x, component)
end

local function macro_recording()
	local reg = vim.fn.reg_recording()
	if reg ~= "" then
		return "@" .. reg
	end
	return ""
end

insert_left({ macro_recording })

insert_left({ "mode" })

insert_left({
	"filename",
	file_status = true,
	path = 1,
})

insert_left({ "location" })

insert_right({ "branch" })

insert_right({
	"diff",
	symbols = {
		added = "",
		modified = "",
		removed = "",
	},
})

insert_right({
	function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
		local clients = vim.lsp.get_clients()

		if next(clients) == nil then
			return msg
		end

		for _, client in ipairs(clients) do
			if client.name == "null-ls" then
				goto continue
			end

			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end

			::continue::
		end

		return msg
	end,
})

insert_right({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "hint" },
	symbols = { error = "", warn = "", hint = "" },
	colored = true,
	update_in_insert = false,
	always_visible = true,
})

return config
