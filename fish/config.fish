# default greeting is 'Welcome to fish, the friendly interactive shell'
set fish_greeting ''
set fish_color_command green
set fish_color_param normal

# neovim as default editor
set -x EDITOR nvim

# use vi mode on prompt
fish_vi_key_bindings

# Don’t clear the screen after quitting a manual page
set -x MANPAGER 'less -X'

# Prefer US English and use UTF-8
set -x LC_ALL 'en_US.UTF-8'
set -x LANG en_US

# Preserve npm version when switching node versions with n
set -x N_PRESERVE_NPM 1

starship init fish | source
