return {
    name = "hls",
    cmd = {
        "haskell-language-server-wrapper",
        "--lsp",
    },
    filetypes = {
        "haskell",
        "hs",
    },
    settings = {
        haskell = {
            formattingProvider = "fourmolu"
        }
    }
}
