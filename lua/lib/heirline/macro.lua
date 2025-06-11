local macro_recording = {
	condition = function()
		return vim.opt.cmdheight:get() == 0 and vim.fn.reg_recording() ~= ""
	end,
	provider = function()
		return "%3(@" .. vim.fn.reg_recording() .. "%) "
	end,
	update = {
		"RecordingEnter",
		"RecordingLeave",
		callback = vim.schedule_wrap(function()
			vim.cmd.redrawstatus()
		end),
	},
}

return macro_recording
