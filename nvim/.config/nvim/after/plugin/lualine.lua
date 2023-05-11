-- Set lualine as statusline
-- See `:help lualine.txt`
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local theme = "tokyonight"

local custom_tokyonight_ok, custom_tokyonight = pcall(require, "lualine.themes.tokyonight")
if custom_tokyonight_ok then
  local tn_colors = require("tokyonight.colors").setup({ transform = true })
  custom_tokyonight.command = {
    a = { bg = tn_colors.orange, fg = tn_colors.black },
    b = { bg = tn_colors.fg_gutter, fg = tn_colors.orange },
  }
  custom_tokyonight.insert = {
    a = { bg = tn_colors.teal, fg = tn_colors.black },
    b = { bg = tn_colors.fg_gutter, fg = tn_colors.teal },
  }
  theme = custom_tokyonight
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
