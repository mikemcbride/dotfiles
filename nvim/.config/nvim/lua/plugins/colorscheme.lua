return {
    {
        'electron-highlighter/nvim',
        name = "electron_highlighter",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
            style = (os.getenv("CURRENT_THEME") == "electron_highlighter_day") and "day" or "default",
        },
        config = function(_, opts)
            require("electron_highlighter").setup(opts)
            vim.cmd.colorscheme("electron_highlighter")
        end
    },
}
