vim.cmd "colorscheme default"

-- local colorscheme = "gruvbox-material"
-- vim.g.gruvbox_material_better_performance = 1

local colorscheme = "tokyonight"
vim.g.tokyonight_style = "storm"

vim.opt.background = "dark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
