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

thefuck --alias | source

# if abbreviations not initialized, set them
if not set -q abbrs_initialized
  set -U abbrs_initialized

  abbr g 'git'
  abbr ga 'git add'
  abbr gb 'git branch'
  abbr gba 'git branch --all'
  abbr gbc 'git checkout -b'
  abbr gbx 'git branch -D'
  abbr gc 'git commit -m'
  abbr gco 'git checkout'
  abbr gcm 'git checkout master'
  abbr gd 'git diff'
  abbr gf 'git fetch --all --prune'
  abbr gl 'git pull'
  abbr glg 'git log'
  abbr gmm 'git merge master'
  abbr gp 'git push'
  abbr gr 'git remote -v'
  abbr gs 'git status'
end