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

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker zsh-autosuggestions kubectl zsh-z zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

zstyle ':completion:*' menu select

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
# else
#   export EDITOR='mvim'
# fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# load extras, aliases, functions, exports
# ~/.extras can be used for things you don't want to commit
for file in ~/.{extras,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

# source custom plugins
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-z/zsh-z.plugin.zsh

# eval starship last
eval "$(starship init zsh)"
