require("gitsigns").setup()
require("gitblame").setup {
    -- Disable git blame annotations by default.
    enabled = false,
}

vim.keymap.set("n", "<leader>gbt", vim.cmd.GitBlameToggle, {})
