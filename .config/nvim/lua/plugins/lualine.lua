return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",  -- load lazily
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/noice.nvim" },
    config = function()
        -- Custom clock function
        local function custom_time()
            return os.date("%H:%M:%S")
        end

        require("lualine").setup({
            options = {
                theme = "moonfly",
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                globalstatus = true,
            },
            sections = {
                lualine_a = { { "mode", right_padding = 2 } },
                lualine_b = { "filename", "branch" },
                lualine_c = { "buffers" },
                lualine_x = { "fileformat", "filetype", "diagnostics",{
                    require("noice").api.statusline.mode.get,
                    cond = require("noice").api.statusline.mode.has,
                    color = { fg = "#ff9e64" },
                }},
                lualine_y = { "location", "progress" },
                lualine_z = { custom_time },
            },
            inactive_sections = {
                lualine_z = { "location" }
            }
        })
    end
}
