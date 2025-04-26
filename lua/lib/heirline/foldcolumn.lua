local FoldColumn = {
    condition = function()
        return vim.o.foldcolumn ~= "0"
    end,
    provider = function()
        local lnum = vim.v.lnum
        local icon = " "
        if vim.fn.foldlevel(lnum) > 0 then
            if vim.fn.foldclosed(lnum) == -1 then
                icon = "" -- dobrado (aberto)
            else
                icon = "" -- fechado
            end
        end
        return icon
    end,
    hl = { fg = "gray" },
    on_click = {
        name = "fold_click",
        callback = function()
            local lnum = vim.v.lnum
            if vim.fn.foldlevel(lnum) > 0 then
                vim.cmd(lnum .. "foldtoggle")
            end
        end,
    },
}

return FoldColumn
