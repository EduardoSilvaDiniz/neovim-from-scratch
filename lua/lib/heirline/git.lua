local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

---@type fun(name: string): vim.api.keyset.get_hl_info
local function get_highlight(name)
    return vim.api.nvim_get_hl(0, { name = name, link = false, create = false })
end

local colors = {
	git_add = get_highlight("GitSignsAdd").fg,
	git_change = get_highlight("GitSignsChange").fg,
	git_del = get_highlight("GitSignsDelete").fg,
}

local Git = {
	condition = conditions.is_git_repo,

	init = function(self)
		self.status_dict = vim.b.gitsigns_status_dict
		self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
	end,

	hl = { fg = "orange" },

	{ -- git branch name
		provider = function(self)
			return " " .. self.status_dict.head
		end,
		hl = { bold = true },
	},
	-- You could handle delimiters, icons and counts similar to Diagnostics
	{
		condition = function(self)
			return self.has_changes
		end,
		provider = "(",
	},
	{
		provider = function(self)
			local count = self.status_dict.added or 0
			return count > 0 and ("+" .. count)
		end,
		hl = { fg = colors.git_add },
	},
	{
		provider = function(self)
			local count = self.status_dict.removed or 0
			return count > 0 and ("-" .. count)
		end,
		hl = { fg = colors.git_del },
	},
	{
		provider = function(self)
			local count = self.status_dict.changed or 0
			return count > 0 and ("~" .. count)
		end,
		hl = { fg = colors.git_change },
	},
	{
		condition = function(self)
			return self.has_changes
		end,
		provider = ")",
	},
}

return Git
