local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Telescope is a fuzzy finder for traversing files in a directory or
    -- Git repository. ripgrep is a dependency.
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Treesitter is a parsing library that builds concrete syntax trees for
    -- source files. This is used in conjunction with other plugins to provide
    -- syntax highlighting, syntax error detection, and a bunch of other stuff
    -- to make the vim experience easier.
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },

    -- Colour scheme/theme.
    {
        "Mofiqul/dracula.nvim",
        config = function()
            vim.cmd("colorscheme dracula")
        end,
    },

    -- LSP Zero provides LSP support for any language required. It has a
    -- number of dependencies to enhance the editor, such as autocomplete, a
    -- package manager for fetching LSPs easier, etc.
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        },
    },

    -- Show line indentations.
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
    },

    -- Git decorations. Shows which lines in a file have been modified, added
    -- or deleted.
    {
        "lewis6991/gitsigns.nvim",
    },

    -- Automatic completion of character pairs (brackets, parentheses, etc).
    -- Also allows for correct indentation of tabs on carriage return.
    {
        "windwp/nvim-autopairs",
        opts = {},
    },

    -- Hovering LSP signature information. Useful when typing to have the
    -- arguments in sight.
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
    },

    -- File tree that replaces netrw.
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },
})
