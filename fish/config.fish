set fish_color_command green
set fish_prompt_pwd_dir_length 1

# default greeting is 'Welcome to fish, the friendly interactive shell'
set fish_greeting ''

# vim as default
set -x EDITOR vim

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

# add rbenv to the path and initialize it
set -x PATH "$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"