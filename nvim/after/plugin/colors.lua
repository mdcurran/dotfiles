local dracula = require("dracula")

dracula.setup({
    overrides = {
        Visual = { fg = "black", bg = "#FFFACD" },
    },
})

function SetColor(color)
    color = color or "dracula"
    vim.cmd.colorscheme(color)
end

SetColor()
