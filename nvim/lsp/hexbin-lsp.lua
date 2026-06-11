return {
    name = "hexbin-lsp",
    cmd = {
        "bun",
        "run",
        "/home/koofte/projects/__active__/hexbin/hexbin-lsp/server.ts",
        "--stdio"
    },
    filetypes = {
        "hexbin",
    },
    root_markers = { ".git" },
}
