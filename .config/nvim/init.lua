local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)
vim.opt.mouse = ""

require("plugins.lazy")
require("core.options")
require("core.keymaps")
require("core.auto")
--[[
local groups = {
  "Normal",
  "NormalNC",
  "SignColumn",
  "VertSplit",
  "StatusLine",
  "StatusLineNC",
  "CursorLine",
  "CursorColumn",
  "ColorColumn",
  "LineNr",
  "CursorLineNr",
  "Folded",
  "FoldColumn",
  "Pmenu",
  "PmenuSel",
  "PmenuSbar",
  "PmenuThumb",
  "TabLine",
  "TabLineFill",
  "TabLineSel",
  "Title",
  "Visual",
  "VisualNOS",
  "Search",
  "IncSearch",
  "DiffAdd",
  "DiffChange",
  "DiffDelete",
  "DiffText",
  "NormalFloat",
  "FloatBorder",
  "TelescopeNormal",
  "TelescopeBorder",
  "TelescopePromptNormal",
  "TelescopePromptBorder",
  "TelescopePromptTitle",
  "TelescopePreviewTitle",
  "TelescopeResultsTitle",
  "NeoTreeNormal",
  "NeoTreeNormalNC",
  "NeoTreeFloatBorder"
}

for _, group in ipairs(groups) do
  vim.api.nvim_set_hl(0, group, { bg = "none" })
end
]]--
