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

require('user.options')
require("lazy").setup('user.plugins', {
  dev = {
      -- directory where you store your local plugin projects
      path = "~/personal/nvim-plugins",
      ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
      patterns = {"electron-highlighter", "mikemcbride"}, -- For example {"folke"}
      fallback = true, -- Fallback to git when local plugin doesn't exist
    }
})
require('user.colorscheme')
require('user.keymaps')
require('user.autocommands')
require('user.commands')
