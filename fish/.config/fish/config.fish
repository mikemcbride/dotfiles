if status is-interactive
    # default greeting is 'Welcome to fish, the friendly interactive shell'
    # to disable, set to empty string
    set fish_greeting ''

    # set the theme
    set -l theme "everforest"
    # set -l theme "electronhighlighter"
:
    if test "$theme" = "everforest"
        set foreground d3c6aa
        set selection 7a8478
        set comment 9da9a0
        set red e67e80
        set orange e69875
        set yellow dbbc7f
        set green a7c080
        set blue 7fbbb3
        set purple d699b6
        set cyan 83c092
    end
    if test "$theme" = "electronhighlighter"
        set foreground a8b5d1
        set selection 364a82
        set comment 506686
        set red f7768e
        set orange ff9e64
        set yellow ffbf7a
        set green 34febb
        set blue 82aaff
        set purple c792ea
        set cyan 4ff2f8
    end

    # Syntax Highlighting Colors
    # https://fishshell.com/docs/current/interactive.html#syntax-highlighting-variables
    set -g fish_color_normal $foreground
    set -g fish_color_command $green
    set -g fish_color_keyword $orange
    set -g fish_color_quote $yellow
    set -g fish_color_redirection $purple
    set -g fish_color_end $orange
    set -g fish_color_error $red
    set -g fish_color_param $foreground
    set -g fish_color_option $yellow
    set -g fish_color_comment $comment
    set -g fish_color_selection --background=$selection
    set -g fish_color_search_match --background=$selection
    set -g fish_color_operator $cyan
    set -g fish_color_escape $orange
    set -g fish_color_autosuggestion $comment
    set -g fish_color_valid_path $foreground

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

    # alias
    alias unset 'set --erase'

    # use vi mode on prompt
    fish_vi_key_bindings

    # Don’t clear the screen after quitting a manual page
    set -x MANPAGER 'less -X'

    # Prefer US English and use UTF-8
    set -x LC_ALL 'en_US.UTF-8'
    set -x LANG en_US


    # ripgrep config
    set -x RIPGREP_CONFIG_PATH $HOME/.ripgreprc

    # if extras file exists, source it.
    if test -e ~/.extras.fish
        source ~/.extras.fish
    end

    set -x TZ_LIST "US/Eastern;US/Mountain;US/Pacific"

    # gum exports (github.com/charmbracelet/gum)
    set -x GUM_FILTER_INDICATOR_FOREGROUND "6" # cyan
    set -x GUM_FILTER_TEXT_FOREGROUND "7" # gray
    set -x GUM_FILTER_MATCH_FOREGROUND "3" # yellow
    set -x GUM_FILTER_PROMPT_FOREGROUND "5" # purple
    set -x GUM_FILTER_PROMPT "❯ "
    set -x GUM_FILTER_INDICATOR "→"
    set -x GUM_FILTER_REVERSE "true"
    set -x GUM_FILTER_HEIGHT "0"
    set -x GUM_CHOOSE_CURSOR_FOREGROUND "6"
    set -x GUM_CHOOSE_CURSOR "→ "
    set -x GUM_CHOOSE_SELECTED_FOREGROUND "6"

    direnv hook fish | source
    starship init fish | source
    zoxide init fish | source
    thefuck --alias | source
    /Users/mike/.local/bin/mise activate fish | source
end
