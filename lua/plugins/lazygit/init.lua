return {
	"kdheepak/lazygit.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	keys = {
		{ "<leader>gl", "<cmd>LazyGit<cr>", desc = "Lazygit" },
	},
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
}
