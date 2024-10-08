local C = require("catppuccin.palettes").get_palette("macchiato")
local O = require("catppuccin").options
local catppuccin_theme = {}

local transparent_bg = O.transparent_background and "NONE" or C.mantle

catppuccin_theme.normal = {
    a = { bg = C.blue, fg = C.mantle, gui = "bold" },
    b = { bg = C.surface0, fg = C.blue },
    c = { bg = transparent_bg, fg = C.text },
}

catppuccin_theme.insert = {
    a = { bg = C.teal, fg = C.base, gui = "bold" },
    b = { bg = C.surface0, fg = C.teal },
}

catppuccin_theme.terminal = {
    a = { bg = C.teal, fg = C.base, gui = "bold" },
    b = { bg = C.surface0, fg = C.teal },
}

catppuccin_theme.command = {
    a = { bg = C.flamingo, fg = C.base, gui = "bold" },
    b = { bg = C.surface0, fg = C.flamingo },
}

catppuccin_theme.visual = {
    a = { bg = C.mauve, fg = C.base, gui = "bold" },
    b = { bg = C.surface0, fg = C.mauve },
}

catppuccin_theme.replace = {
    a = { bg = C.maroon, fg = C.base, gui = "bold" },
    b = { bg = C.surface0, fg = C.maroon },
}

catppuccin_theme.inactive = {
    a = { bg = transparent_bg, fg = C.blue },
    b = { bg = transparent_bg, fg = C.surface1, gui = "bold" },
    c = { bg = transparent_bg, fg = C.overlay0 },
}

return {
    'nvim-lualine/lualine.nvim',
    opts = {
        options = {
            icons_enabled = true,
            theme = "electron_highlighter",
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
}
