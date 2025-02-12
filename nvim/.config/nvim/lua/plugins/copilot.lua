return {
    "zbirenbaum/copilot.lua",
    opts = {
        panel = {
            auto_refresh = false,
            keymap = {
                accept = "<CR>",
                jump_prev = "[[",
                jump_next = "]]",
                refresh = "gr",
                open = "<M-CR>",
            },
        },
        suggestion = {
            auto_trigger = true,
            keymap = {
                accept = "<C-y>",
                prev = "<C-p>",
                next = "<C-n>",
                dismiss = "<C-]>",
            },
        },
    }
}

