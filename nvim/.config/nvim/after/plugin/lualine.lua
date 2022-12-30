-- Set lualine as statusline
-- See `:help lualine.txt`
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup {
  theme = "tokyonight",
  options = {
    icons_enabled = true,
    theme = "auto",
    icons_enabled = false,
    theme = 'onedark',
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