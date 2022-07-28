# Source Prezto
if [[ -s ~/.zprezto/init.zsh ]]; then
  source ~/.zprezto/init.zsh
fi

# use z for better fuzzy searching
if [[ -s ~/z/z.sh ]]; then
	source ~/z/z.sh
fi

# load extras, aliases, functions, exports
# ~/.extras can be used for things you don't want to commit
for file in ~/.{extras,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

# set vi mode
bindkey -v

# enable ctrl-r for reverse search
bindkey '^R' history-incremental-search-backward

# set up history for reverse search
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# exports
export KEYTIMEOUT=1 # reduce lag in keybindings
export PATH="$PATH:~/.node/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/local/mysql/bin"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

eval "$(starship init zsh)"
