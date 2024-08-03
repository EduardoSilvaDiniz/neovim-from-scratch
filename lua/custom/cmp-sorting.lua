local cmp = require("cmp")
return {
  comparators = {
    cmp.config.compare.exact,
    cmp.config.compare.recently_used,
    cmp.config.compare.score,
  },
}
