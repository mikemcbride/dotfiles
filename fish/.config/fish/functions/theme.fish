function theme --description 'Switch all configured tools between light and dark mode'
    set -l state_file ~/.config/theme-mode
    set -l current (cat $state_file 2>/dev/null; or echo dark)

    # Resolve target mode — no argument toggles the current one.
    set -l mode $argv[1]
    if test -z "$mode"
        if test "$current" = light
            set mode dark
        else
            set mode light
        end
    end
    if not contains -- $mode light dark
        echo "usage: theme [light|dark]   (no argument toggles current mode)" >&2
        return 1
    end

    # Per-mode identifiers.
    set -l current_theme
    set -l ghostty_theme
    set -l tmux_conf
    if test "$mode" = light
        set current_theme electron_highlighter_day
        set ghostty_theme "Electron Highlighter Day"
        set tmux_conf ~/personal/electron-highlighter/tmux/electron_highlighter_day.conf
    else
        set current_theme electron_highlighter
        set ghostty_theme "Electron Highlighter"
        set tmux_conf ~/personal/electron-highlighter/tmux/electron_highlighter.conf
    end

    # Persist the source of truth, and update this shell so anything launched
    # from here (e.g. nvim) inherits the new value immediately.
    echo $mode >$state_file
    set -gx CURRENT_THEME $current_theme

    echo "Switching to $mode mode:"

    # herdr — live reload.
    if type -q herdr-theme
        if herdr-theme $mode >/dev/null 2>&1
            echo "  herdr    ✓ live"
        else
            echo "  herdr    ✓ set (applies next herdr; server not running)"
        end
    end

    # tmux — point the active symlink at the variant, reload if a server is up.
    ln -sf $tmux_conf ~/.config/tmux/theme-active.conf
    if tmux ls >/dev/null 2>&1
        tmux source-file ~/.tmux.conf >/dev/null 2>&1
        echo "  tmux     ✓ live"
    else
        echo "  tmux     ✓ set (applies next tmux server)"
    end

    # Zed — watches settings.json and reloads live. It's JSONC (comments +
    # trailing commas), so edit with sed rather than jq. Flips theme + icon_theme.
    # (sed -i differs between GNU and BSD, so write-to-temp-then-move is used
    # throughout for portability.)
    set -l zed ~/.config/zed/settings.json
    if test -f $zed
        sed -E 's/"mode": "(light|dark)"/"mode": "'$mode'"/g' $zed >$zed.tmp; and mv $zed.tmp $zed
        echo "  zed      ✓ live"
    end

    # Claude Code — built-in light-ansi / dark-ansi; picked up by new sessions.
    set -l claude ~/.claude/settings.json
    if test -f $claude
        sed -E 's/"theme": "(light|dark)-ansi"/"theme": "'$mode'-ansi"/' $claude >$claude.tmp; and mv $claude.tmp $claude
        echo "  claude   ↻ new sessions"
    end

    # Ghostty — swap the managed theme line; reload is manual (cmd+shift+,).
    set -l ghostty ~/.config/ghostty/config
    if test -f $ghostty
        sed -E 's/^theme = .*/theme = '$ghostty_theme'/' $ghostty >$ghostty.tmp; and mv $ghostty.tmp $ghostty
        echo "  ghostty  ⌨  press cmd+shift+, to reload"
    end

    # nvim + fish syntax colors read CURRENT_THEME at startup.
    echo "  nvim     ↻ new instances"
    echo "theme → $mode"
end
