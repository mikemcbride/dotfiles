vim.opt.background = "dark"

-- override some default tokyonight themes
-- require("tokyonight").setup({
--   style = "night",
--   styles = {
--     sidebars = "transparent",
--     floats = "transparent",
--   },
--   on_highlights = function(hl, c)
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

local colorscheme = "electron_highlighter"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.cmd "colorscheme default"
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
