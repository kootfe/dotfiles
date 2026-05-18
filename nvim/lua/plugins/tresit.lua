return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag"
    },
    config = function()
        require("nvim-treesitter.config").setup({
            ensure_installed = {
                "c",
                "cpp",
                "javascript",
                "typescript",
                "rust",
                "java",
                "python",
                "bash",
                "elixir",
                "eex",
                "heex",
                "vim",
                "tera",
                "dart",
                "go",
                "haskell",
                "commonlisp",
                "zsh",
                "latex"
            },

            highlight = { enable = true },

            autotag = {
                enable = true
            }
        })
    end
}

