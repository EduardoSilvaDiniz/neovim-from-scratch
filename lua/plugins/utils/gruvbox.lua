return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = {},
    init = function()
        vim.cmd("colorscheme gruvbox")
    end
}
