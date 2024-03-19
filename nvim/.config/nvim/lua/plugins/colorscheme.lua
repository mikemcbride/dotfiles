return {
    {
        'electron-highlighter/nvim',
        priority = 1000,
        name = "electron_highlighter",
        config = function()
            require("electron_highlighter").setup({
                style = "night",
                transparent = true,
                on_highlights = function(hl, c)
                    local float_bg             = "#1b212c"
                    local prompt_bg            = "#212836"
                    hl.Visual                  = { bg = c.bg_highlight }
                    hl.FloatBorder             = { bg = float_bg, fg = c.cyan }
                    hl.NormalFloat             = { bg = float_bg }
                    -- telescope.nvim
                    hl.TelescopeNormal         = { bg = float_bg, fg = c.fg }
                    hl.TelescopeBorder         = { bg = float_bg, fg = float_bg }
                    hl.TelescopeMatching       = { fg = c.orange }
                    hl.TelescopeMultiSelection = { fg = c.fg_dark }

                    hl.TelescopePreview        = { link = "NormalFloat" }
                    hl.TelescopePreviewBorder  = { link = "TelescopeBorder" }
                    hl.TelescopePreviewLine    = { link = "NormalFloat" }
                    hl.TelescopePreviewNormal  = { link = "NormalFloat" }
                    hl.TelescopePreviewTitle   = { bg = c.teal, fg = c.bg_highlight }

                    hl.TelescopePrompt         = { link = "TelescopeNormal" }
                    hl.TelescopePromptBorder   = { bg = prompt_bg, fg = prompt_bg }
                    hl.TelescopePromptNormal   = { bg = prompt_bg, fg = c.fg_dark }
                    hl.TelescopePromptPrefix   = { bg = prompt_bg, fg = c.cyan }
                    hl.TelescopePromptTitle    = { link = "TelescopePreviewTitle" }

                    hl.TelescopeResultsBorder  = { link = "TelescopeBorder" }
                    hl.TelescopeResultsNormal  = { link = "NormalFloat" }
                    hl.TelescopeResultsTitle   = { link = "TelescopeBorder" }

                    hl.TelescopeSelection      = { bg = c.bg_highlight }
                    hl.TelescopeSelectionCaret = { fg = c.fg_dark }
                end,

            })
            vim.cmd.colorscheme "electron_highlighter"
        end
    }
}
