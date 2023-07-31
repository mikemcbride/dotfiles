vim.opt.background = "dark"

-- override some default tokyonight themes
-- require("tokyonight").setup({
--   style = "night",
--   styles = {
--     sidebars = "transparent",
--     floats = "transparent",
--   },
--   on_highlights = function(hl)
--     hl.Visual = {
--       bg = "#37435C",
--     }
--   end,
-- })

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
