local utils = {}

-- Função para inserir elementos em uma tabela
function utils.insert(tbl, ...)
	for _, v in ipairs({ ... }) do
		table.insert(tbl, v)
	end
	return tbl
end

local conditions = {}
function conditions.width_percent_below(width, percent)
	return width < (vim.o.columns * percent)
end

local FileNameBlock = {
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(0)
	end,
}


local FileName = {
	provider = function(self)
		local filename = vim.fn.fnamemodify(self.filename, ":.")
		if filename == "" then
			return "[No Name]"
		end
		if not conditions.width_percent_below(#filename, 0.25) then
			filename = vim.fn.pathshorten(filename)
		end
		return filename
	end,
}

local FileFlags = {
	{
		condition = function()
			return vim.bo.modified
		end,
		provider = " [+]",
		hl = { fg = "#98971a" },
	},
	{
		condition = function()
			return not vim.bo.modifiable or vim.bo.readonly -- Arquivo não modificável ou somente leitura
		end,
		provider = " [readonly]",
		hl = { fg = "#d79921" },
	},
}

FileNameBlock = utils.insert(
	FileNameBlock,
	FileName,
	FileFlags,
	{ provider = "%<" }
)

return FileNameBlock
