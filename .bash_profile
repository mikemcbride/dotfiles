# use z for better fuzzy searching
if [[ -s ~/z/z.sh ]]; then
	source ~/z/z.sh
fi

# load prompt, aliases, functions, exports
# ~/.extras can be used for things you don't want to commit
for file in ~/.{extras,bash_prompt,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

# source local aliases
if [[ -f ~/.aliases.local ]]; then
  source ~/.aliases.local
fi

# source git-completion
if [[ -f ~/dotfiles/git-completion.bash ]]; then
  source ~/dotfiles/git-completion.bash
fi

# set vi mode
set -o vi

##
## gotta tune that bash_history...
##

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
export HISTTIMEFORMAT='%F %T '

# keep history up to date, across sessions, in realtime
#  http://unix.stackexchange.com/a/48113
export HISTCONTROL="erasedups:ignoreboth"       # no duplicate entries
export HISTSIZE=100000                          # big big history (default is 500)
export HISTFILESIZE=$HISTSIZE                   # big big history
type shopt &> /dev/null && shopt -s histappend  # append to history, don't overwrite it

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Save multi-line commands as one command
shopt -s cmdhist

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# z beats cd most of the time. `brew install z`
zpath="$(brew --prefix)/etc/profile.d/z.sh"
[ -s $zpath ] && source $zpath

##
## better `cd`'ing
##

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Correct spelling errors in arguments supplied to cd
shopt -s cdspell;

# Autocorrect on directory names to match a glob.
shopt -s dirspell 2> /dev/null

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null




##
## exports. this needs to be at the bottom for things like rbenv, jenv, and sdkman to work.
##

# reduce lag in keybindings
export KEYTIMEOUT=1

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# set JENV_ROOT for jenv to work
export JENV_ROOT="/usr/local/opt/jenv"
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
export JAVA_HOME="/usr/local/opt/jenv/versions/1.8.0.77"
export PATH="$HOME/.jenv/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"