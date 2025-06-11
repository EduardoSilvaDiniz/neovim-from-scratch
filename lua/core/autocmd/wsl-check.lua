vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if require("lib.utils").whoa_system("microsoft") then
			vim.g.clipboard = {
				name = "WslClipboard",
				copy = {
					["+"] = "clip.exe",
					["*"] = "clip.exe",
				},
				paste = {
					["+"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
					["*"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
				},
				cache_enabled = false,
			}
		end
	end,
})
