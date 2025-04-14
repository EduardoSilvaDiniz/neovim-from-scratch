	vim.api.nvim_create_autocmd(
  { "BufWritePost", "TextChanged"},
  {
    pattern = {"*.java", "*.html"},
		callback = function()
      local root = vim.fn.findfile("build.gradle", ".;")
      if root == "" then return end
      root = vim.fn.fnamemodify(root, ":p:h") -- pega só o diretório

      vim.fn.jobstart("./gradlew classes", {
        cwd = root,
        stdout_buffered = true,
        stderr_buffered = true,
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
    end,
  }
)

