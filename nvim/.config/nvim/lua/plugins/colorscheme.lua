return {
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
            -- vim.cmd.colorscheme "catppuccin"
        end
    },
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        opts = {
            style = "storm",
            transparent = true,
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
                hl.CursorNormal            = { bg = c.fg_dark, fg = c.fg_dark }
                hl.CursorVisual            = { bg = c.magenta, fg = c.magenta }
                hl.CursorInsert            = { bg = c.green, fg = c.green }
            end,
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)
            -- vim.cmd.colorscheme "tokyonight"
        end
    },
    {
        'electron-highlighter/nvim',
        name = "electron_highlighter",
        lazy = false,
        priority = 1000,
        opts = {
            style = "default",
            transparent = true,
            on_highlights = function(hl, c)
                local float_bg             = "#1f2335"
                hl.FloatBorder             = { bg = float_bg, fg = c.cyan }
                hl.NormalFloat             = { bg = float_bg }

                -- cursors change color based on mode
                hl.CursorNormal            = { bg = c.fg_dark, fg = c.fg_dark }
                hl.CursorVisual            = { bg = c.magenta, fg = c.magenta }
                hl.CursorInsert            = { bg = c.green, fg = c.green }

                -- telescope.nvim
                hl.TelescopeNormal         = { bg = float_bg, fg = c.fg }
                hl.TelescopeBorder         = { bg = float_bg, fg = c.orange }
                hl.TelescopeMatching       = { fg = c.orange }
                hl.TelescopeMultiSelection = { fg = c.fg_dark }
                hl.TelescopePreview        = { link = "NormalFloat" }
                hl.TelescopePreviewBorder  = { link = "TelescopeBorder" }
                hl.TelescopePreviewLine    = { link = "NormalFloat" }
                hl.TelescopePreviewNormal  = { link = "NormalFloat" }
                hl.TelescopePreviewTitle   = { link = "TelescopeBorder" }

                hl.TelescopePrompt         = { link = "TelescopeNormal" }
                hl.TelescopePromptBorder   = { bg = float_bg, fg = c.orange }
                hl.TelescopePromptNormal   = { bg = float_bg, fg = c.fg_dark }
                hl.TelescopePromptPrefix   = { bg = float_bg, fg = c.orange }
                hl.TelescopePromptTitle    = { link = "TelescopeBorder" }

                hl.TelescopeResultsBorder  = { link = "TelescopeBorder" }
                hl.TelescopeResultsNormal  = { link = "NormalFloat" }
                hl.TelescopeResultsTitle   = { link = "TelescopeBorder" }

                hl.TelescopeSelection      = { bg = c.bg_highlight, fg = c.orange }
                hl.TelescopeSelectionCaret = { fg = c.fg_dark }
            end,
        },
        config = function(_, opts)
            require("electron_highlighter").setup(opts)
            vim.cmd.colorscheme "electron_highlighter"
        end
    },
}
