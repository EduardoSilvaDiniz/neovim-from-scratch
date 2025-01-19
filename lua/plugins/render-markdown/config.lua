return {
	indent = {
		-- Turn on / off org-indent-mode
		enabled = true,
		-- Additional modes to render indents
		render_modes = true,
		-- Amount of additional padding added for each heading level
		per_level = 2,
		-- Heading levels <= this value will not be indented
		-- Use 0 to begin indenting from the very first level
		skip_level = 1,
		-- Do not indent heading titles, only the body
		skip_heading = false,
	},
	sign = {
		-- Turn on / off sign rendering
		enabled = false,
		-- Applies to background of sign text
		highlight = "RenderMarkdownSign",
	},
	dash = {
		-- Turn on / off thematic break rendering
		enabled = false,
		-- Additional modes to render dash
		render_modes = false,
		-- Replaces '---'|'***'|'___'|'* * *' of 'thematic_break'
		-- The icon gets repeated across the window's width
		icon = "─",
		-- Width of the generated line:
		--  <number>: a hard coded width value, if a floating point value < 1 is provided it is
		--            treated as a percentage of the available window space
		--  full:     full width of the window
		width = "full",
		-- Amount of margin to add to the left of dash
		-- If a floating point value < 1 is provided it is treated as a percentage of the available window space
		left_margin = 0,
		-- Highlight for the whole line generated from the icon
		highlight = "RenderMarkdownDash",
	},
}
