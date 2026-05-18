return {
    name = "texlab",
    cmd = { "texlab" },
    filetypes = { "tex", "plaintex", "latex" },

    settings = {
        texlab = {
            forwardSearch = {
                exectuable = "zathura",
                args = { "--synctex-forward", "%l:1:%f", "%p" },
            },
            chktex = {
                onOpenAndSave = true,
            },
        }
    }
}
