-- Set lualine as statusline
-- See `:help lualine.txt`
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local theme = "auto"

-- if theme is tokyonight or electronhighlighter then we'll set some custom colors.
-- otherwise just use "auto" and let it be good enough
local terminal_theme = vim.env.CURRENT_THEME
if (terminal_theme == "tokyonight")
then
  theme = "tokyonight"
  local custom_tokyonight_ok, custom_tokyonight = pcall(require, "lualine.themes.tokyonight")
  if custom_tokyonight_ok then
    local eh_colors = require("tokyonight.colors").setup({ transform = true })
    custom_tokyonight.command = {
      a = { bg = eh_colors.orange, fg = eh_colors.black },
      b = { bg = eh_colors.fg_gutter, fg = eh_colors.orange },
    }
    custom_tokyonight.insert = {
      a = { bg = eh_colors.teal, fg = eh_colors.black },
      b = { bg = eh_colors.fg_gutter, fg = eh_colors.teal },
    }
    theme = custom_tokyonight
  end
elseif (terminal_theme == "electronhighlighter")
then
  theme = "electron_highlighter"
  local custom_electron_highlighter_ok, custom_electron_highlighter = pcall(require, "lualine.themes.electron_highlighter")
  if custom_electron_highlighter_ok then
    local eh_colors = require("electron_highlighter.colors").setup({ transform = true })
    custom_electron_highlighter.command = {
      a = { bg = eh_colors.orange, fg = eh_colors.black },
      b = { bg = eh_colors.fg_gutter, fg = eh_colors.orange },
    }
    custom_electron_highlighter.insert = {
      a = { bg = eh_colors.teal, fg = eh_colors.black },
      b = { bg = eh_colors.fg_gutter, fg = eh_colors.teal },
    }
    theme = custom_electron_highlighter
  end
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = '|',
    section_separators = '',
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      {
        "branch",
        icons_enabled = true,
        icon = "",
      }
    },
    lualine_c = {
      {
        "filename",
        file_status = true,
        path = 1
      }
    },
    lualine_x = { "encoding", "filetype" },
    lualine_y = { "location" },
    lualine_z = { "progress" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        "filename",
        file_status = true,
        path = 1
      }
    },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
