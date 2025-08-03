return function()
	require("lint").linters_by_ft = {
		go = { "golangcilint" },
		lua = { "luacheck" },
		java = { "checkstyle" },
		nix = { "deadnix" },
		c = { "cpplint" },
		["*"] = { "editorconfig-checker" },
	}
end
