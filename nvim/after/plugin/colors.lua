function SetColor(color)
    color = color or "dracula"
    vim.cmd.colorscheme(color)
end

SetColor()
