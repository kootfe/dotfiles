return {
    name = "roslyn_ls",
    cmd = {
        "roslyn-language-server",
        "--logLevel=Information",
        "--stdio",
    },
    filetypes = { "cs" },
    root_markers = {
        "*.sln",
        "*.csproj",
        ".git",
    },
    settings = {},
}
