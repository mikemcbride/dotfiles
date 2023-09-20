vim.opt.background = "dark"
-- set colorscheme to default first, as a fallback,
-- so that we have something set if we don't match on environment variable
vim.cmd.colorscheme "default"

require("electron_highlighter").setup({
  style = "night",
  transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent",
  },
  on_highlights = function(hl, c)
    local float_bg = "#1b212c"
    hl.Visual = {
      bg = c.bg_highlight,
    }
    hl.FloatBorder = {
      bg = float_bg,
      fg = c.cyan,
    }
    hl.NormalFloat = {
      bg = float_bg
    }
    hl.TelescopeNormal = {
      bg = float_bg,
      fg = c.fg,
    }
    hl.TelescopeBorder = {
      bg = float_bg,
      fg = c.cyan,
    }
    hl.TelescopePromptNormal = {
      bg = float_bg,
      fg = c.fg_dark,
    }
    hl.TelescopePromptBorder = {
      bg = float_bg,
      fg = c.cyan,
    }
    hl.TelescopePromptTitle = {
      bg = float_bg,
      fg = c.cyan,
    }
    hl.TelescopePreviewTitle = {
      bg = float_bg,
      fg = c.cyan,
    }
    hl.TelescopeResultsTitle = {
      bg = float_bg,
      fg = c.cyan,
    }
    hl.TelescopeMatching = { fg = c.cyan }
    hl.TelescopePromptPrefix = { fg = c.cyan }
    hl.TelescopeResultsNormal = {
      bg = float_bg
    }
    hl.TelescopePreviewNormal = { bg = float_bg }
    hl.TelescopeSelection = {
      bg = c.bg_highlight
    }
  end,

})
vim.cmd.colorscheme "electron_highlighter"
