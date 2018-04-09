# default greeting is 'Welcome to fish, the friendly interactive shell'
set fish_greeting ''
set fish_color_command green
set fish_color_param normal

# vim as default
set -x EDITOR vim

# use vi mode on prompt
fish_vi_key_bindings

# Don’t clear the screen after quitting a manual page
set -x MANPAGER 'less -X'

# Prefer US English and use UTF-8
set -x LC_ALL 'en_US.UTF-8'
set -x LANG en_US


# .extras contains stuff like my $PATH,
# which I don't want to put on GitHub.
if test -e ~/.extras
  source ~/.extras
end