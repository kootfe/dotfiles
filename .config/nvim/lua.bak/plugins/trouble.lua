return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("trouble").setup {
            signs = { error = "", warning = "", hint = "", information = "" },
            use_diagnostic_signs = true,
        }
        vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle focus=false filter.buf=0<cr>", { silent = true })
    end,
}
