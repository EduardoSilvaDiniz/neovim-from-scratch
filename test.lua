local function findFiles()
	local status, files = pcall(io.popen, 'find "$HOME"/.config/nvim/lua/plugins -type f')

	if not status then
		print("The find command could not be executed")
	end

	return files
end

local function clearPath(filePath)
	return filePath:gmatch("%/lua%/(.+).lua$")({ 0 }):gsub("/", ".")
end

local function tableFactory()
	pluginsTable = {}
	files = findFiles()

	for file in files:lines() do
		pluginPath = clearPath(file)

		if
			not string.find(pluginPath, "config")
			and not string.find(pluginPath, "keymap")
			and not string.find(pluginPath, "plugins.init")
		then
			status, objPlugin = pcall(print, "plugin encontrado " .. pluginPath)

			if not status then
				print("not found plugin " .. pluginPath)
			end
		end
	end
end

tableFactory()
