local config = require("plugins.nvim-jdtls.config")
local function build_project()
	local root = vim.fn.findfile("build.gradle", ".;")
	if root == "" then
		return
	end
	root = vim.fn.fnamemodify(root, ":p:h") -- pega só o diretório
	vim.fn.jobstart("./gradlew classes", {
		cwd = root,
		stdout_buffered = true,
		stderr_buffered = false,
		on_stdout = function(_, data)
			if data and data[1] ~= "" then
				vim.notify(table.concat(data, "\n"), vim.log.levels.INFO, { title = "Gradle Build" })
			end
		end,
		on_stderr = function(_, data)
			if data and data[1] ~= "" then
				vim.notify(table.concat(data, "\n"), vim.log.levels.ERROR, { title = "Gradle Error" })
			end
		end,
	})
end

vim.keymap.set("n", "<leader>co", build_project, { desc = "compila projeto gradle" })

require("jdtls").start_or_attach(config)

local jdtls = require("jdtls")
vim.keymap.set("n", "<leader>vc", jdtls.test_class, { desc = "Test class (DAP)" })
vim.keymap.set("n", "<leader>vm", jdtls.test_nearest_method, { desc = "Test method (DAP)" })
