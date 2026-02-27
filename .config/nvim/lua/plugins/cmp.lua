return {
    "saghen/blink.cmp",
    dependencies = { "L3MON4D3/LuaSnip" },
    version = "1.*",
    opts = {
        snippets = { preset = "luasnip" },

        keymap = { preset = "enter" },

        appearance = { nerd_font_variant = "mono" },

        completion = {
            documentation = { auto_show = false },
            list = { selection = { preselect = true, auto_insert = false } },
            accept = { auto_brackets = { enabled = false } },
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}

