# Source Prezto
if [[ -s ~/.zprezto/init.zsh ]]; then
  source ~/.zprezto/init.zsh
fi

# use z for better fuzzy searching
if [[ -s ~/z/z.sh ]]; then
	source ~/z/z.sh
fi

# source aliases
if [[ -f ~/dotfiles/.aliases ]]; then
  source ~/dotfiles/.aliases
fi

# source local aliases
if [[ -f ~/.aliases.local ]]; then
  source ~/.aliases.local
fi

# source functions
if [[ -f ~/dotfiles/.functions ]]; then
  source ~/dotfiles/.functions
fi

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

# set JENV_ROOT for jenv to work
export JENV_ROOT="/usr/local/opt/jenv"
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
export JAVA_HOME="/usr/local/opt/jenv/versions/1.8.0.77"
export PATH="$HOME/.jenv/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
