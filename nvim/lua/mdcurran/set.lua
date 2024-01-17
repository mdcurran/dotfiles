-- Add line numbers to the margin and show relative line numbers above and
-- below. Jump multiple lines using <number><direction>.
vim.opt.nu = true
vim.opt.relativenumber = true

-- Disable line wrapping.
vim.opt.wrap = false

-- 4-indent tabs.
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

-- Disable the lingering highlighting when searching a term.
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- Ensure there are always 8 spaces below the cursor when scrolling down a
-- file (unless at EOF).
vim.opt.scrolloff = 8

vim.opt.updatetime = 50
-- Add a line at column 80 as a reference point.
vim.opt.colorcolumn = "80"

-- Replace the bottom bar with the command prompt when in-use.
vim.opt.cmdheight = 0
