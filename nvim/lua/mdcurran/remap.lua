vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move captured blocks up or down and conform to the indentation of the scope
-- the block is currently in.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv'")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv'")

-- Append the following line to the end of the current line with a space but
-- keep the cursor in-place, instead of moving to the end of the line.
vim.keymap.set("n", "J", "mzJ`Z")

-- Half-page jumps but keep the cursor in-place.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- When pasting from the clipboard, don't replace what's in the buffer with
-- what has just been overwritten. Mimics copy-paste behaviour you'd expect
-- from any OS.
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Disable capital Q!
vim.keymap.set("n", "Q", "<nop>")
