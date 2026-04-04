return {
	"kdheepak/lazygit.nvim",
	lazy = true,
	dependencies = "nvim-lua/plenary.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	keys = {
		{ "lg", "<cmd>LazyGit<cr>", desc = "lazygit" },
	},
}
