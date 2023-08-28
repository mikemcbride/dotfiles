vim.opt.background = "dark"
-- set colorscheme to default first, as a fallback,
-- so that we have something set if we don't match on environment variable
vim.cmd.colorscheme "default"

local theme = vim.env.CURRENT_THEME

if (theme == "tokyonight")
then
  -- tokyonight theme
  require("tokyonight").setup({
    style = "night",
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
    on_highlights = function(hl)
      hl.Visual = {
        bg = "#37435C",
      }
    end,
  })
  vim.cmd.colorscheme "tokyonight"
elseif (theme == "gruvbox")
then
  -- gruvbox-material theme
  require("gruvbox_material").setup({
    transparent_mode = true,
    contrast = "hard",
    italic = {
      strings = false,
      comments = false,
      operators = false,
      folds = false,
    },
  })
  vim.cmd.colorscheme "gruvbox_material"
elseif (theme == "electronhighlighter")
then
  require("electron_highlighter").setup({
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
    on_highlights = function(hl, c)
      hl.Visual = {
        bg = c.bg_highlight,
      }
    end,
  })
  vim.cmd.colorscheme "electron_highlighter"
end
