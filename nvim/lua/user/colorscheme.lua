vim.cmd "colorscheme default"

local colorscheme = "everforest"
-- local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.opt.background = "dark"

vim.g.gruvbox_contrast_dark = "hard"

vim.g.everforest_background = 'hard'
vim.g.everforest_better_performance = 1

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
