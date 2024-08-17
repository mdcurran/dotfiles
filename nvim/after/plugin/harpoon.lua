local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>hh", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "4", function() harpoon:list():select(4) end)

-- Telescope configuration.
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    local finder = function()
        return require("telescope.finders").new_table({
            results = file_paths,
        })
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = finder(),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
        -- Add a keymap to delete harpooned buffers from the quick menu.
        attach_mappings = function(prompt_buffer_number, map)
            map("i", "§§", function()
                local state = require("telescope.actions.state")
                local selection = state.get_selected_entry()
                local current = state.get_current_picker(prompt_buffer_number)

                harpoon:list():remove(selection, selection.index)
                current:refresh(finder())
            end)
            return true
        end
    }):find()
end

vim.keymap.set("n", "<leader>hh", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })
