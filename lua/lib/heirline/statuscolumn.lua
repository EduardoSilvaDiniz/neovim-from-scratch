-- local utils = require("heirline.utils")

local NumberColumn = {
    condition = function()
        -- Ative somente se a coluna de número estiver visível
        return vim.wo.number or vim.wo.relativenumber
    end,

    provider = function()
        return "%l "  -- número da linha com espaço para padding à direita
    end,

    on_click = {
        name = "line_click",
        callback = function(_, minwid, clicks, button, mods)
            local mousepos = vim.fn.getmousepos()
            local line = mousepos.line
            vim.cmd(tostring(line))

            if package.loaded["dap"] and require("dap") and vim.fn.exists(":DapToggleBreakpoint") == 2 then
                require("dap").toggle_breakpoint()
            end
        end,
    },

    -- hl = function()
    --     return { fg = utils.get_highlight("LineNr").fg }
    -- end,
}

return NumberColumn
