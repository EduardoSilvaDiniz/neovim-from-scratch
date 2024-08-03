local cmp = require("cmp")
return {
  completion = cmp.config.window.bordered({
    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None,CursorLine:MyCursorLine",
    side_padding = 0,
  }),
}
