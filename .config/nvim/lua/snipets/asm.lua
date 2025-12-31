local luasnip = require("luasnip")

luasnip.add_snippets("all", {
    luasnip.snippet("mov", luasnip.text_node("mov %eax, %ebx")),
    luasnip.snippet("push", luasnip.text_node("push %eax")),
    luasnip.snippet("pop", luasnip.text_node("pop %eax")),
})

