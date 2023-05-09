if status is-interactive
    # default greeting is 'Welcome to fish, the friendly interactive shell'
    set fish_greeting ''

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

    # abbreviations
    abbr --add dotdot --regex '^\.\.+$' --function multicd
    abbr -a !! --position anywhere --function last_history_item

    # use vi mode on prompt
    fish_vi_key_bindings

    # Don’t clear the screen after quitting a manual page
    set -x MANPAGER 'less -X'

    # Prefer US English and use UTF-8
    set -x LC_ALL 'en_US.UTF-8'
    set -x LANG en_US


    # ripgrep config
    set -x RIPGREP_CONFIG_PATH $HOME/.ripgreprc

    # goprivate
    set -x GOPRIVATE github.com/nytimes

    # aws
    set -x AWS_PROFILE lettercase-dev-tenant-dev-foundations

    # gum exports (github.com/charmbracelet/gum)
    set -x GUM_FILTER_INDICATOR_FOREGROUND "6" # cyan
    set -x GUM_FILTER_TEXT_FOREGROUND "7" # gray
    set -x GUM_FILTER_MATCH_FOREGROUND "3" # yellow
    set -x GUM_FILTER_PROMPT_FOREGROUND "5" # purple
    set -x GUM_FILTER_PROMPT " "
    set -x GUM_FILTER_INDICATOR "ﰲ"
    set -x GUM_FILTER_REVERSE "true"
    set -x GUM_FILTER_HEIGHT "0"
    set -x GUM_CHOOSE_CURSOR_FOREGROUND "6"
    set -x GUM_CHOOSE_CURSOR " "
    set -x GUM_CHOOSE_SELECTED_FOREGROUND "6"

    starship init fish | source
end

