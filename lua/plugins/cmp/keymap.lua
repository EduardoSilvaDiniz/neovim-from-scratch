local M = {}

local function get_cmp()
	local ok_cmp, cmp = pcall(require, "cmp")
	return ok_cmp and cmp or {}
end

local function get_luasnip()
	local ok_luasnip, luasnip = pcall(require, "luasnip")
	return ok_luasnip and luasnip or {}
end

local function luasnip_jump_forward()
	local cmp = get_cmp()
	local luasnip = get_luasnip()

	return cmp.mapping(function(fallback)
		if luasnip.jumpable(1) then
			luasnip.jump(1)
		else
			fallback()
		end
	end, { "i", "s" })
end

local function luasnip_jump_backward()
	local cmp = get_cmp()
	local luasnip = get_luasnip()

	return cmp.mapping(function(fallback)
		if luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { "i", "s" })
end

local function luasnip_supertab(select_opts)
	local cmp = get_cmp()
	local luasnip = get_luasnip()

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

local function luasnip_shift_supertab(select_opts)
	local cmp = get_cmp()
	local luasnip = get_luasnip()

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

function M.setup(cmp)
	return {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-f"] = luasnip_jump_forward(),
		["<C-b"] = luasnip_jump_backward(),
		["<Tab>"] = luasnip_supertab(),
		["<S-Tab>"] = luasnip_shift_supertab(),
	}
end

return M
