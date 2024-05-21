return {
    -- {
    --     "mikemcbride/gruvbox-material.nvim",
    --     priority = 1000,
    --     as = "gruvbox_material",
    --     opts = {
    --         transparent_mode = true,
    --         contrast = "soft",
    --     },
    --     config = function(_, opts)
    --         require("gruvbox_material").setup(opts)
    --         -- vim.cmd.colorscheme "gruvbox_material"
    --     end
    -- },
    -- {
    --     "neanias/everforest-nvim",
    --     version = false,
    --     lazy = false,
    --     priority = 1000,
    --     opts = {
    --         background = "hard",
    --         transparent_background_level = 1,
    --         on_highlights = function(hl, c)
    --             -- cursors change color based on mode
    --             hl.CursorNormal = { bg = c.fg, fg = c.fg }
    --             hl.CursorVisual = { bg = c.purple, fg = c.purple }
    --             hl.CursorInsert = { bg = c.aqua, fg = c.aqua }
    --         end,
    --     },
    --     config = function(_, opts)
    --         require("everforest").setup(opts)
    --         -- vim.cmd.colorscheme "everforest"
    --     end,
    -- },
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
                local prompt_bg            = "#212836"
                hl.Visual                  = { bg = c.bg_highlight }
                hl.FloatBorder             = { bg = float_bg, fg = c.cyan }
                hl.NormalFloat             = { bg = float_bg }

                -- cursors change color based on mode
                hl.CursorNormal            = { bg = c.fg_dark, fg = c.fg_dark }
                hl.CursorVisual            = { bg = c.magenta, fg = c.magenta }
                hl.CursorInsert            = { bg = c.green, fg = c.green }

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
        },
        config = function(_, opts)
            require("electron_highlighter").setup(opts)
            vim.cmd.colorscheme "electron_highlighter"
        end
    }
}
