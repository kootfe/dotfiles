return {
    name = "clangd",
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=bundled",
        "--cross-file-rename",
        "--compile-commands-dir=build",
    },
    filetypes = {
        "c",
        "h",
    },
}

--[[
lspconfig.clangd.setup({
    cmd = {
        "clangd",
        "--background-index",         -- index project in background
        "--clang-tidy",               -- enable clang-tidy
        "--completion-style=detailed", -- no argument autocompletion
        "--cross-file-rename",        -- optional, if you rename symbols
        "--compile-commands-dir=build",
    },
    filetypes = { "c", "cpp", "objc" },
    capabilities = capabilities,
    root_dir = get_root,
})
]]--
