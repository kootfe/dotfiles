return {
    "goolord/alpha-nvim",
    event = "VimEnter",  -- load on startup
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Header
        dashboard.section.header.val = {
            " __    __     ______        __    __     ______     ______     ______   ______     ______     __         __        ",
            "/\\ \"-./  \\   /\\  == \\      /\\ \"-./  \\   /\\  ___\\   /\\  __ \\   /\\__  _\\ /\\  == \\   /\\  __ \\   /\\ \\       /\\ \\       ",
            "\\ \\ \\-./\\ \\  \\ \\  __<      \\ \\ \\-./\\ \\  \\ \\  __\\   \\ \\  __ \\  \\/_/\\ \\/ \\ \\  __<   \\ \\  __ \\  \\ \\ \\____  \\ \\ \\____  ",
            " \\ \\_\\ \\ \\_\\  \\ \\_\\ \\_\\     \\ \\_\\ \\ \\_\\  \\ \\_____\\  \\ \\_\\ \\_\\    \\ \\_\\  \\ \\_____\\  \\ \\_\\ \\_\\  \\ \\_____\\  \\ \\_____\\ ",
            "  \\/_/  \\/_/   \\/_/ /_/      \\/_/  \\/_/   \\/_____/   \\/_/\\/_/     \\/_/   \\/_____/   \\/_/\\/_/   \\/_____/   \\/_____/ ",
            "                           Chilling... Coding... And cats... ",
        }

        -- Top buttons
        dashboard.section.buttons.val = {
            dashboard.button("o", "Open File", ":Neotree toggle float <CR>"),
            dashboard.button("l", "Lazy", ":Lazy<CR>"),
            dashboard.button("c", "Config NeoVim", ":e ~/.config/nvim/init.lua <CR>:cd ~/.config/nvim<cr>"),
            dashboard.button("u", "Update Lazy", ":Lazy sync<CR>"),
            dashboard.button("q", "Quit NeoVim", ":q!<CR>"),
        }

        -- Setup alpha
        alpha.setup(dashboard.config)
    end
}

