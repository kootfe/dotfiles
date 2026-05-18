return {
    name = "gopls",
    cmd = { "gopls" },  -- make sure gopls is in your $PATH
    filetypes = { "go" },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
    init_options = {
        usePlaceholders = true,
        completeUnimported = true,
    },
}
