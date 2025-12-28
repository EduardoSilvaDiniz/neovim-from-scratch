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
		table.insert(clients, {
			name = "jdtls",
			config = {
				filetypes = { "java" },
			},
		})

		if clients == nil then
			return msg
		end

		for _, client in ipairs(clients) do
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
	function()
		local ok, laravel_version = pcall(function()
			return Laravel.app("status"):get("laravel")
		end)
		if ok then
			return laravel_version
		end
	end,
	icon = { " ", color = { fg = "#F55247" } },
	cond = function()
		local ok, has_laravel_versions = pcall(function()
			return Laravel.app("status"):has("laravel")
		end)
		return ok and has_laravel_versions
	end,
})

insert_right({
	function()
		local ok, php_version = pcall(function()
			return Laravel.app("status"):get("php")
		end)
		if ok then
			return php_version
		end
		return nil
	end,
	icon = { " ", color = { fg = "#AEB2D5" } },
	cond = function()
		local ok, has_php_version = pcall(function()
			return Laravel.app("status"):has("php")
		end)
		return ok and has_php_version
	end,
})

insert_right({
	function()
		local ok, hostname = pcall(function()
			return Laravel.extensions.composer_dev.hostname()
		end)
		if ok then
			return hostname
		end
		return nil
	end,
	icon = { " ", color = { fg = "#8FBC8F" } },
	cond = function()
		local ok, is_running = pcall(function()
			return Laravel.extensions.composer_dev.isRunning()
		end)
		return ok and is_running
	end,
})

insert_right({
	function()
		local ok, unseen_records = pcall(function()
			return #(Laravel.extensions.dump_server.unseenRecords())
		end)

		if ok then
			return unseen_records
		end
		return 0
	end,
	icon = { "󰱧 ", color = { fg = "#FFCC66" } },
	cond = function()
		local ok, is_running = pcall(function()
			return Laravel.extensions.dump_server.isRunning()
		end)

		return ok and is_running
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
