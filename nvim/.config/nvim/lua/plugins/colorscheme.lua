return {
    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        opts = {
            transparent_background_level = 1,
            colours_override = function(palette)
                palette.bg_visual = palette.bg3
                palette.statusline1 = palette.grey1
                palette.statusline2 = palette.green
                palette.statusline3 = palette.purple
            end,
            on_highlights = function(hl, c)
                local float_bg             = "#2d353b"
                -- cursors change color based on mode
                hl.CursorNormal            = { bg = c.fg, fg = c.fg }
                hl.CursorVisual            = { bg = c.purple, fg = c.purple }
                hl.CursorInsert            = { bg = c.aqua, fg = c.aqua }

                -- hl.FloatBorder             = { bg = float_bg, fg = c.green }

                -- telescope.nvim
                hl.TelescopeBorder         = { fg = c.yellow, bg = float_bg }
                hl.TelescopePreviewBorder  = { link = "TelescopeBorder" }
                hl.TelescopePreviewTitle   = { link = "TelescopeBorder" }
                hl.TelescopePromptTitle    = { link = "TelescopeBorder" }
                hl.TelescopeResultsBorder  = { link = "TelescopeBorder" }
                hl.TelescopeResultsTitle   = { link = "TelescopeBorder" }

                hl.TelescopeNormal         = { fg = c.fg, bg = float_bg }
                hl.TelescopePrompt         = { link = "TelescopeNormal" }

                hl.TelescopeMatching       = { fg = c.yellow }
                hl.TelescopeMultiSelection = { fg = c.fg }
                hl.TelescopePromptBorder   = { bg = float_bg, fg = c.yellow }
                hl.TelescopePromptNormal   = { bg = float_bg, fg = c.fg }
                hl.TelescopePromptPrefix   = { bg = float_bg, fg = c.yellow }
                hl.TelescopeSelection      = { fg = c.yellow, bg = c.bg_visual }
                hl.TelescopeSelectionCaret = { fg = c.yellow, bg = c.bg_visual }

                hl.NormalFloat             = { bg = float_bg }
                hl.TelescopePreview        = { link = "NormalFloat" }
                hl.TelescopePreviewLine    = { link = "NormalFloat" }
                hl.TelescopePreviewNormal  = { link = "NormalFloat" }
                hl.TelescopeResultsNormal  = { link = "NormalFloat" }
            end
        },
        config = function(_, opts)
            require("everforest").setup(opts)
        end,
    },
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
}
