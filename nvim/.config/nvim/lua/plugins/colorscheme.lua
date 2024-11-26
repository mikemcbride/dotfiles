return {
    {
        'electron-highlighter/nvim',
        name = "electron_highlighter",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
        },
        config = function(_, opts)
            require("electron_highlighter").setup(opts)
        end
    },
    {
        "mikemcbride/gruvbox-material.nvim",
        priority = 1000,
        as = "gruvbox_material",
        opts = {
            transparent_mode = true,
            contrast = "soft",
            italic = {
                strings = false,
            }
        },
        config = function(_, opts)
            require("gruvbox_material").setup(opts)
        end
    },
    {
        'folke/tokyonight.nvim',
        laze = false,
        priority = 1000,
        opts = {
            transparent = true,
            style = 'storm',
            styles = {
                keywords = { italic = false },
                functions = {},
            },
            on_colors = function(colors)
                colors.bg_visual = "#404f77"
                colors.bg_highlight = colors.bg_visual
            end,
            on_highlights = function(hl, c)
                -- cursors change color based on mode
                hl.CursorNormal = { bg = c.fg_dark, fg = c.fg_dark }
                hl.CursorVisual = { bg = c.magenta, fg = c.magenta }
                hl.CursorInsert = { bg = c.green, fg = c.green }
            end,
        },
        config = function(_, opts)
            require('tokyonight').setup(opts)
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = "macchiato",
            transparent_background = true,
            integration = {
                telescope = true,
                mason = true,
            },
            custom_highlights = function(colors)
                return {
                    -- cursors change color based on mode
                    CursorNormal = { bg = colors.text, fg = colors.text },
                    CursorVisual = { bg = colors.mauve, fg = colors.mauve },
                    CursorInsert = { bg = colors.teal, fg = colors.teal }
                }
            end
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
        end
    },
}
