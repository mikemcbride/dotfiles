local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
--  that is why this mapping is not in keymaps.lua
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('options')
require("lazy").setup("plugins")
vim.cmd.colorscheme(os.getenv("CURRENT_THEME") or "electron_highlighter")
require('keymaps')
require('autocommands')
require('commands')
