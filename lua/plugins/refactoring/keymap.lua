local refactoring = require("refactoring")
return {
	{ "<leader>re",  "<cmd>Refactor extract<cr>",               { desc = "extract" },              "x" },
	{ "<leader>rf",  "<cmd>Refactor extract_to_file<cr>",       { desc = "extract to file" },      "x" },
	{ "<leader>rv",  "<cmd>Refactor extract_var<cr>",           { desc = "extract var" },          "x" },
	{ "<leader>ri",  "<cmd>Refactor inline_var<cr>",            { desc = "inline var" },           { "n", "x" } },
	{ "<leader>rI",  "<cmd>Refactor inline_func<cr>",           { desc = "inline_func" } },
	{ "<leader>rb",  "<cmd>Refactor extract_block<cr>",         { desc = "extract_block" } },
	{ "<leader>rbf", "<cmd>Refactor extract_block_to_file<cr>", { desc = "extract_block_to_file" } },
}
