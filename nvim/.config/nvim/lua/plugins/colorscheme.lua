return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = "latte",
            transparent_background = true,
            custom_highlights = function(colors)
                return {
                    CursorInsert = { fg = colors.blue, bg = colors.blue },
                    CursorVisual = { fg = colors.mauve, bg = colors.mauve },
                }
            end
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
        end
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
            -- vim.cmd.colorscheme("electron_highlighter")
        end
    },
}
