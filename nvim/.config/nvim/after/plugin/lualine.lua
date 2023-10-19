-- Set lualine as statusline
-- See `:help lualine.txt`
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local theme = "auto"
-- if theme is electronhighlighter or eighties then we'll set some custom colors.
-- otherwise just use "auto" and let it be good enough
local terminal_theme = vim.env.CURRENT_THEME
if (terminal_theme == "electronhighlighter")
then
  theme = "electron_highlighter"
elseif (terminal_theme == "eighties")
then
  theme = "eighties"
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
