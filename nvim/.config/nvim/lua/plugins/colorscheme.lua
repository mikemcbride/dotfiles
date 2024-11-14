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
}
