local builtin = require("telescope.builtin")
local telescope = require("telescope")

telescope.setup {
    defaults = {
        sorting_strategy = 'descending',
    },
    pickers = {
        find_files = {
            find_command = {'rg', '--files', '--hidden', '-g', '!.git'},
        },
    },
}

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("grep: ") })
end)
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>pd", builtin.diagnostics, {})
