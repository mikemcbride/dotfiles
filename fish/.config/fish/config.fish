if status is-interactive
    # default greeting is 'Welcome to fish, the friendly interactive shell'
    # to disable, set to empty string
    set fish_greeting ''

    # makes sure the global npm folder is in the PATH in the right spot
    fish_add_path -m ~/.npm-global/bin

    # Theme (light/dark). Single source of truth: ~/.config/theme-mode holds
    # "light" or "dark". Switch everything at once with the `theme` function.
    set -l theme_mode (cat ~/.config/theme-mode 2>/dev/null; or echo dark)

    if test "$theme_mode" = "light"
        set -gx CURRENT_THEME electron_highlighter_day
        set foreground 2f3b54
        set selection d6def5
        set comment 7b88a8
        set red f52a65
        set orange f0633c
        set yellow d18a16
        set green 10a877
        set blue 366ff0
        set purple 8b4fe0
        set cyan 0a9fbf
        set pink e62b86
    else
        set -gx CURRENT_THEME electron_highlighter
        set foreground a8b5d1
        set selection 364a82
        set comment 506686
        set red ff93a7
        set orange ffd9af
        set yellow ffd9af
        set green 58ffc7
        set blue 82aaff
        set purple d2a6ef
        set cyan 57f9ff
    end

    # bat: the "base16" theme already follows the terminal's ANSI palette, so it
    # tracks light/dark for free. When you add a dedicated bat day theme, wire it
    # here (and drop the --theme line from ~/.config/bat/config):
    # if test "$theme_mode" = "light"
    #     set -gx BAT_THEME "Electron Highlighter Day"
    # else
    #     set -gx BAT_THEME "Electron Highlighter"
    # end

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
    # mise manages work tooling (terraform, vault, etc.), but Node is owned
    # exclusively by fnm (see conf.d/fnm.fish). Disabling node here prevents
    # mise and fnm from fighting over the Node version.
    set -gx MISE_DISABLE_TOOLS node
    if command -q mise
        mise activate fish | source
    end

    set -gx ATUIN_NOBIND "true"
    atuin init fish | source

    # bind to ctrl-r in normal and insert mode, add any other bindings you want here too
    bind \cr _atuin_search
    bind -M insert \cr _atuin_search
    bind -M insert up _atuin_search
end

# pnpm
set -gx PNPM_HOME "/Users/mike/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# opencode
fish_add_path /Users/mike/.opencode/bin
