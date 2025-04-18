local SignColumn = {
    provider = function()
        return "%s" -- mostra a signcolumn padrão do Neovim
    end,

    condition = function()
        return vim.wo.signcolumn ~= "no"
    end,

    on_click = {
        name = "sign_click",
        callback = function()
            local mousepos = vim.fn.getmousepos()
            local line = mousepos.line
            local buf = vim.api.nvim_get_current_buf()

            -- busca os sinais colocados na linha
            local signs = vim.fn.sign_getplaced(buf, {
                group = "*",
                lnum = line,
            })[1].signs

            if not signs or #signs == 0 then return end

            local sign = signs[1]
            local name = sign.name

            -- verifica se é um sinal do gitsigns
            if name:match("^GitSigns") and package.loaded.gitsigns then
                require("gitsigns").preview_hunk()
            end
        end,
    },
}

return SignColumn
