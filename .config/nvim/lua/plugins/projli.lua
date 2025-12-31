return {
    dir = "~/.config/nvim/lua/projli", 
    config = function ()
        local projli = require("projli");
        projli.setup({
            msg = "Test",
        })
        projli.test()
    end,
    lazy = false,
}
