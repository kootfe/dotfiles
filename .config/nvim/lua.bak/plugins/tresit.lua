return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = { "c", "cpp", "javascript", "typescript", "rust", "java", "python", "bash", "elixir", "eex", "heex" },
            highlight = { enable = true },
        }
    end 
}

