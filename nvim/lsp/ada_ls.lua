return {
    name = "ada_ls",
    cmd = { "ada_language_server" },
    filetypes = { "ada", "adb", "ads" },
    root_markers = {
        "default.gpr",
        ".git",
    },
    settings = {
        ada = {
            projectFile = "default.gpr",
        },
    },
}
