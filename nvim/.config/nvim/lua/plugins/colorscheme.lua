return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            transparent_background = true,
            integration = {
                telescope = true,
                mason = true,
            },
            color_overrides = {
                latte = {
                    base = "#f7fafc",
                    mantle = "#f1f5f9",
                    crust = "#e7ebef",
                    text = "#424c57",
                    red = "#ef4444",
                    green = "#10b981",
                    yellow = "#ea580c",
                    blue = "#2563eb",
                    pink = "#e11d48",
                    teal = "#06b6d4",
                    mauve = "#7c3aed",
                }
            },
            custom_highlights = function(colours)
                local float_bg = colours.base
                local fg = colours.text
                local telescope_results = colours.base
                local telescope_prompt = colours.surface0
                local remaps = {
                    NormalFloat = { bg = float_bg },
                    TelescopeBorder = { fg = telescope_results, bg = telescope_results },
                    TelescopePromptBorder = { fg = telescope_prompt, bg = telescope_prompt },
                    TelescopePromptCounter = { fg = fg },
                    TelescopePromptNormal = { fg = fg, bg = telescope_prompt },
                    TelescopePromptPrefix = { fg = colours.teal, bg = telescope_prompt },
                    TelescopePromptTitle = { fg = telescope_prompt, bg = colours.teal },
                    TelescopePreviewTitle = { fg = telescope_prompt, bg = colours.red },
                    TelescopeResultsTitle = { fg = telescope_results, bg = telescope_results },
                    TelescopeMatching = { fg = colours.teal },
                    TelescopeNormal = { bg = telescope_results },
                    TelescopeSelection = { bg = telescope_prompt },
                }
                return remaps
            end,
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme "catppuccin"
        end
    },
    -- {
    --     'electron-highlighter/nvim',
    --     priority = 1000,
    --     name = "electron_highlighter",
    --     opts = {
    --         style = "night",
    --         transparent = true,
    --         on_highlights = function(hl, c)
    --             local float_bg             = "#1b212c"
    --             local prompt_bg            = "#212836"
    --             hl.Visual                  = { bg = c.bg_highlight }
    --             hl.FloatBorder             = { bg = float_bg, fg = c.cyan }
    --             hl.NormalFloat             = { bg = float_bg }
    --             -- telescope.nvim
    --             hl.TelescopeNormal         = { bg = float_bg, fg = c.fg }
    --             hl.TelescopeBorder         = { bg = float_bg, fg = float_bg }
    --             hl.TelescopeMatching       = { fg = c.orange }
    --             hl.TelescopeMultiSelection = { fg = c.fg_dark }
    --
    --             hl.TelescopePreview        = { link = "NormalFloat" }
    --             hl.TelescopePreviewBorder  = { link = "TelescopeBorder" }
    --             hl.TelescopePreviewLine    = { link = "NormalFloat" }
    --             hl.TelescopePreviewNormal  = { link = "NormalFloat" }
    --             hl.TelescopePreviewTitle   = { bg = c.teal, fg = c.bg_highlight }
    --
    --             hl.TelescopePrompt         = { link = "TelescopeNormal" }
    --             hl.TelescopePromptBorder   = { bg = prompt_bg, fg = prompt_bg }
    --             hl.TelescopePromptNormal   = { bg = prompt_bg, fg = c.fg_dark }
    --             hl.TelescopePromptPrefix   = { bg = prompt_bg, fg = c.cyan }
    --             hl.TelescopePromptTitle    = { link = "TelescopePreviewTitle" }
    --
    --             hl.TelescopeResultsBorder  = { link = "TelescopeBorder" }
    --             hl.TelescopeResultsNormal  = { link = "NormalFloat" }
    --             hl.TelescopeResultsTitle   = { link = "TelescopeBorder" }
    --
    --             hl.TelescopeSelection      = { bg = c.bg_highlight }
    --             hl.TelescopeSelectionCaret = { fg = c.fg_dark }
    --         end,
    --     },
    --     config = function(_, opts)
    --         require("electron_highlighter").setup(opts)
    --         vim.cmd.colorscheme "electron_highlighter"
    --     end
    -- }
}
