local bufferline = require("bufferline")

bufferline.setup({
	options = {
		buffer_close_icon = "",
		mode = "buffers",
		always_show_bufferline = true,
		enforce_regular_tabs = true,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or " ")
				s = s .. n .. sym
			end
			return s
		end,
	},
})
