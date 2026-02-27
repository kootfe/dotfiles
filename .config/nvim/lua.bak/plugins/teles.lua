return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    config = function()
        local telescope = require("telescope")
        telescope.setup{
            defaults = {
                prompt_prefix = "🔍 ",
                selection_caret = " ",
                path_display = { "smart" },
            },
            pickers = {
                find_files = {
                    theme = "dropdown",
                },
                live_grep = {
                    theme = "ivy",
                },
            },
        }
    end,
}

