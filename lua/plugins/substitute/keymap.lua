
local substitute = require("substitute")
return {
	{ "s",  substitute.operator, { noremap = true } },
	{ "ss", substitute.line,     { noremap = true } },
	{ "S",  substitute.eol,      { noremap = true } },
	{ "s",  substitute.visual,   { noremap = true }, { "x" } },
}
