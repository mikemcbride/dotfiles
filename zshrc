# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sublime atom)

source $ZSH/oh-my-zsh.sh

# User configuration
# Git
alias pull="git pull"
alias push="git push"
alias gmm="git merge master"

alias k="clear"
alias gs="grunt serve"
alias vi=vim
alias ...="../.."
alias ....="../../.."
alias .....="../../../.."
alias delete="rm -rf"
alias please=sudo
alias atom="atom ."
alias tmux="TERM=screen-256color tmux"
alias update_vim_plugins="cd ~/.vim && git submodule foreach git pull origin master"
alias ssh_cvharris="ssh 50.116.21.75"
alias wwt="cd ~/wwt"
alias fs_apps="cd ~/wwt/ServiceNow/filesync/"
alias filesync="/Applications/ServiceNow/filesync/filesync.command;"
alias filesync_all='for f in $(find ~/wwt/ServiceNow/filesync -name "*" -type f); do cat /dev/null | tee "$f"; done;'
alias filesync_this='for f in $(find . -name "*" -type f); do cat /dev/null | tee "$f"; done;'
export PATH="/Users/mcbridem/.node/bin:/Users/mcbridem/.rvm/gems/ruby-2.1.4/bin:/Users/mcbridem/.rvm/gems/ruby-2.1.4@global/bin:/Users/mcbridem/.rvm/rubies/ruby-2.1.4/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/Users/mcbridem/.rvm/bin"

function cd(){
  emulate -L zsh
  builtin cd $@ &&
  ls -la
}

function replace_ext {
  for f in *.$1; do 
    mv -- "$f" "${f%.$1}.$2"
  done
}

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
