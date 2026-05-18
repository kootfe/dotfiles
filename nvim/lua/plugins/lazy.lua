-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "git@github.com:folke/lazy.nvim.git", "--branch=stable", lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

-- plugin list
require("lazy").setup({
    require("plugins.theme"),
    "goolord/alpha-nvim",
    "nvim-lualine/lualine.nvim",
    "nvim-tree/nvim-web-devicons",
    -- LSP, CMP, Treesitter, Telescope, etc...
    {
        "L3MON4D3/LuaSnip",
        lazy = false,
    },
    require("plugins.tree"),
    require("plugins.cmp"),
    require("plugins.trouble"),
    require("plugins.notify"),
    require("plugins.noice"),
    require("plugins.alpha"),
    require("plugins.tresit"),
    require("plugins.teles"),
    require("plugins.lualine"),
    require("plugins.symbols"),
    require("plugins.gitsigns"),
 --   require("plugins.waketime"),
    require("plugins.rpc"),
})

