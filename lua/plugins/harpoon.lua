return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { silent = true })
		vim.keymap.set("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { silent = true })

    vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { silent = true })
    vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { silent = true })
    vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { silent = true })
    vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { silent = true })
    vim.keymap.set("n", "<leader>h5", function() harpoon:list():select(5) end, { silent = true })
    vim.keymap.set("n", "<leader>h6", function() harpoon:list():select(6) end, { silent = true })
    vim.keymap.set("n", "<leader>h7", function() harpoon:list():select(7) end, { silent = true })
    vim.keymap.set("n", "<leader>h8", function() harpoon:list():select(8) end, { silent = true })
    vim.keymap.set("n", "<leader>h9", function() harpoon:list():select(9) end, { silent = true })
    vim.keymap.set("n", "<leader>h0", function() harpoon:list():select(10) end, { silent = true })

		vim.keymap.set("n", "<C-P>", function()
			harpoon:list():prev()
		end, { silent = true })
		vim.keymap.set("n", "<C-N>", function()
			harpoon:list():next()
		end, { silent = true })
	end,
}
