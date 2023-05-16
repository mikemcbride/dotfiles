# set up history for reverse search
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# exports
export KEYTIMEOUT=1 # reduce lag in keybindings

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode zsh-autosuggestions zsh-z zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
unalias gco

zstyle ':completion:*' menu select

# add stuff to PATH
local gopath_bin="$(go env GOPATH)/bin"

typeset -U path
path=($path
      $HOME/.local/bin
      $HOME/.node/bin
      /usr/local/bin
      /usr/local/sbin
      /usr/bin
      /bin
      /usr/sbin
      /sbin
      /opt/X11/bin
      /usr/local/git/bin
      /usr/local/mysql/bin
      /opt/homebrew/sbin
      /opt/homebrew
      /opt/homebrew/bin
      $gopath_bin
  )
export PATH

# load extras, aliases, functions, exports
# ~/.extras can be used for things you don't want to commit
for file in ~/.{extras,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

# source custom plugins
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-z/zsh-z.plugin.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# put keybindings at the bottom to prevent overwriting
# enable ctrl-r for reverse search
bindkey '^R' history-incremental-search-backward

# bind ctrl-f to tmux-sessionizer
bindkey -s '^F' "tmux-sessionizer\n"

# bind ctrl-g to tmux-session-switcher
bindkey -s '^G' "tmux-session-switcher\n"

# bind ctrl-k to tmux-session-killer
bindkey -s '^K' "tmux-session-killer\n"

# eval starship last
eval "$(starship init zsh)"
