return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag"
    },
    config = function()
        local treesitter = require("nvim-treesitter.config");
        treesitter.setup({
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
                "tera"
            },

            highlight = { enable = true },

            autotag = {
                enable = true
            }
        })
    end
}

