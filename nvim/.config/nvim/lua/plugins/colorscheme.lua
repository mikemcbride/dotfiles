return {
    {
        'electron-highlighter/nvim',
        lazy = false,
        priority = 1000,
        name = "electron_highlighter",
        opts = {
            style = "night",
            transparent = true,
            on_highlights = function(hl, c)
                local float_bg             = "#1b212c"
                hl.Visual                  = { bg = c.bg_highlight }
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
                --
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

                hl.TelescopeSelection      = { bg = c.bg_highlight }
                hl.TelescopeSelectionCaret = { fg = c.fg_dark }
            end,
        },
        config = function(_, opts)
            require("electron_highlighter").setup(opts)
            vim.cmd.colorscheme "electron_highlighter"
        end
    }
}
