# Make mise-managed tools (node, etc.) available in ALL shells, including
# non-interactive ones (scripts, `fish -c`, editors). This replaces the role
# fnm's conf.d used to play. Interactive shells additionally run the full
# `mise activate fish` from config.fish.
if test -d $HOME/.local/share/mise/shims
    fish_add_path -g $HOME/.local/share/mise/shims
end
