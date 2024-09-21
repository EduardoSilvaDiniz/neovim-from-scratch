local M = {}

function M.findFiles()
	status, files = pcall(io.popen, 'find "$HOME"/.config/nvim/lua/' .. "plugins" .. " -type f")
	if not status then
		vim.print("The find command could not be executed")
	end

	return files
end

function M.clearPath(filePath)
	return filePath:gmatch("%/lua%/(.+).lua$")({ 0 }):gsub("/", ".")
end

return M
