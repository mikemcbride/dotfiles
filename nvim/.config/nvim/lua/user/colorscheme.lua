vim.cmd "colorscheme default"

vim.opt.background = "dark"

local colorscheme = "catppuccin"
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup({
    integrations = {
        cmp = true,
        nvimtree = true,
        treesitter_context = true,
        treesitter = true,
        telescope = true,
        which_key = true
    }
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
