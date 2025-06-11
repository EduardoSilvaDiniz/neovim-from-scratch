---@diagnostic disable: undefined-field
local M = {}
local cmp = require("cmp")
local luasnip = require("luasnip")

function M.luasnip_jump_forward()
	return cmp.mapping(function(fallback)
		if luasnip.jumpable(1) then
			luasnip.jump(1)
		else
			fallback()
		end
	end, { "i", "s" })
end

function M.luasnip_jump_backward()
	return cmp.mapping(function(fallback)
		if luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { "i", "s" })
end

function M.luasnip_supertab()
	return cmp.mapping(function(fallback)
		local col = vim.fn.col(".") - 1

		if cmp.visible() then
			cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
		elseif luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
			fallback()
		else
			cmp.complete()
		end
	end, { "i", "s" })
end

function M.luasnip_shift_supertab(select_opts)
	return cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item(select_opts)
		elseif luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { "i", "s" })
end

return M
