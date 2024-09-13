require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "go",
        "javascript",
        "json",
        "lua",
        "python",
        "rust",
        "toml",
        "typescript",
        "yaml"
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
