vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.g.have_nerd_font = true
vim.wo.number = true
vim.lsp.inlay_hint.enable(true)
vim.opt.signcolumn = "yes:1"
vim.diagnostic.config({
  virtual_text = false, -- Desativa mensagens inline
  signs = true,         -- Mantém os ícones laterais
  underline = true,     -- Mantém sublinhado
})
local signs = {
	Error = "",
	Warn = "",
	Hint = "",
	Info = "",
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
vim.api.nvim_set_hl(0, "FloatBorder", { bg = normal_bg })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = normal_bg })
vim.api.nvim_set_hl(0, "SignColumn", { bg = normal_bg })

vim.keymap.set("n", "<leader>qq", "<cmd>q<cr>", { desc = "sair do neovim" })
vim.keymap.set("n", "<leader>qs", "<cmd>q!<cr>", { desc = "sair do neovim sem salvar" })
vim.keymap.set("n", "<leader>ql", "<cmd>NeovimProjectLoadRecent<cr>", { desc = "restaurar ultima sessão" })
