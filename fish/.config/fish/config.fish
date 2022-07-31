if status is-interactive
    # default greeting is 'Welcome to fish, the friendly interactive shell'
    set fish_greeting ''

    # Electron Highlighter
    # set -l foreground a8b5d1
    # set -l selection c1ddff
    # set -l comment 506686
    # set -l red ff5874
    # set -l orange ffbf7a
    # set -l yellow fffa9e
    # set -l green 6af699
    # set -l purple c792ea
    # set -l cyan 4ff2f8
    # set -l pink ff2c83

    # TokyoNight Color Palette
    set -l foreground c0caf5
    set -l selection 364A82
    set -l comment 565f89
    set -l red f7768e
    set -l orange ff9e64
    set -l yellow e0af68
    set -l green 9ece6a
    set -l purple 9d7cd8
    set -l cyan 7dcfff
    set -l pink bb9af7

    # Gruvbox Material Color Palette
    # set -l foreground d4be98
    # set -l selection 424242
    # set -l comment 777777
    # set -l red ea6962
    # set -l orange e78a4e
    # set -l yellow d8a657
    # set -l green a9b665
    # set -l purple d3869b
    # set -l cyan 89b482
    # set -l pink f6a0b7
    
    # Syntax Highlighting Colors
    set -g fish_color_normal $foreground
    set -g fish_color_command $green
    set -g fish_color_keyword $pink
    set -g fish_color_quote $yellow
    set -g fish_color_redirection $foreground
    set -g fish_color_end $orange
    set -g fish_color_error $red
    set -g fish_color_param $foreground
    set -g fish_color_comment $comment
    set -g fish_color_selection --background=$selection
    set -g fish_color_search_match --background=$selection
    set -g fish_color_operator $green
    set -g fish_color_escape $pink
    set -g fish_color_autosuggestion $comment
    
    # Completion Pager Colors
    set -g fish_pager_color_progress $comment
    set -g fish_pager_color_prefix $cyan
    set -g fish_pager_color_completion $foreground
    set -g fish_pager_color_description $comment

    # neovim as default editor
    set -gx EDITOR nvim

    # use vi mode on prompt
    fish_vi_key_bindings

    # Don’t clear the screen after quitting a manual page
    set -x MANPAGER 'less -X'

    # Prefer US English and use UTF-8
    set -x LC_ALL 'en_US.UTF-8'
    set -x LANG en_US

    starship init fish | source
end

