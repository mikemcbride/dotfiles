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
--       bg = c.orange,
--       fg = c.bg_dark,
--     }
--     hl.TelescopeSelection = {
--       fg = c.bg_dark,
--       bg = c.orange,
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
      bg = c.orange,
      fg = c.bg_dark,
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
