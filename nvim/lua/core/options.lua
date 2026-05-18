vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.cursorline = true
vim.opt.fillchars = { fold = " " }
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 99

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "dart", "haskell", "zsh", "bash", "sh" },
    callback = function ()
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
    end
})
