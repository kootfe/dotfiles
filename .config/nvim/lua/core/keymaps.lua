bltin = require("telescope.builtin")
vim.keymap.set('n', '<C-f>', bltin.find_files, { noremap = true, silent = true })
vim.keymap.set('n', '<C-d>', ':Telescope live_grep<cr>', { noremap = true, silent = true })


vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-s>', '<ESC>:w<CR>i', { noremap = true, silent = true })
vim.keymap.set('n', '<C-o>', ':Neotree toggle float<CR>P', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>v', '<C-w>v<C-o>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h', '<C-w>s<C-o>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>o', '<C-w>o', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>c', '<C-w>c', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>c', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>p', 'mzggVG"+y<C-[>`zi', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>i', 'mzgg=G`z', { noremap = true, silent=true })
vim.keymap.set('n', '<C-q>', ':SymbolsOutline<CR>', { noremap = true, silent = true })

vim.api.nvim_create_user_command('Config', function()
    vim.cmd('e ~/.config/nvim/init.lua')
end, {})

