return function()
	require("lint").linters_by_ft = {
		go = {},
		lua = {},
		java = { "checkstyle" },
	}
end
