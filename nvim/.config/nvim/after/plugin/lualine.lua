-- Set lualine as statusline
-- See `:help lualine.txt`
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local theme = "auto"
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
