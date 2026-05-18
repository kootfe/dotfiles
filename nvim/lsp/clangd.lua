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

