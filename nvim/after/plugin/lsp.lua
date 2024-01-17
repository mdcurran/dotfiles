local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(_, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
end)

require("mason").setup{}
require("mason-lspconfig").setup {
    ensure_installed = {
        "eslint",
        "gopls",
        "lua_ls",
        "rust_analyzer"
    },
    handlers = {
        lsp_zero.default_setup,
    },
}

local cmp = require("cmp")
local cmp_select = {behaviour = cmp.SelectBehavior.Select}

cmp.setup {
    sources = {
        {name = "path"},
        {name = "nvim_lsp"},
        {name = "nvim_lua"},
        {name = "luasnip", keyword_length = 2},
        {name = "buffer", keyword_length = 3},
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert {
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    },
}
