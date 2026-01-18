return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",  -- load when entering insert mode
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
      

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "luasnip" },
            }),
            formatting = {
                format = function(entry, vim_item)
                    local item = entry:get_completion_item()

                    -- Remove leading whitespace
                    item.label = (item.label or ""):gsub("^%s+", "")

                    -- Replace textEdit.newText if exists
                    if item.textEdit and item.textEdit.newText then
                        item.textEdit.newText = item.label
                    end

                    -- Also trim insertText leading whitespace
                    if item.insertText then
                        item.insertText = item.insertText:gsub("^%s+", "")
                    end

                    vim_item.abbr = item.label
                    return vim_item
                end,
            },
        })
    end
}
