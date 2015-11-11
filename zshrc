# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mike"

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

# use z for better fuzzy searching
source ~/z/z.sh

# use nvm
source ~/.nvm/nvm.sh

# User configuration
# Git
alias pull="git pull"
alias push="git push"
alias gmm="git merge master"

# NPM
alias set_registry_npm="npm set registry https://registry.npmjs.org/"
alias set_registry_wwt="npm set registry http://sinopia.wwt.com/"

alias k="clear"
alias x="exit"
alias ltr="ls -ltr"
alias vi=vim
alias ...="../.."
alias ....="../../.."
alias .....="../../../.."
alias delete="rm -rf"
alias please=sudo
alias atom="atom ."
alias resource="source ~/.zshrc"
alias tmux="TERM=screen-256color tmux"
alias update_vim_plugins="cd ~/.vim && git submodule foreach git pull origin master"
alias ssh_cvharris="ssh 50.116.21.75"
alias wwt="cd ~/wwt"
alias tomcat_start="/Library/Tomcat/bin/startup.sh"
alias tomcat_start="/Library/Tomcat/bin/shutdown.sh"
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
export DYLD_LIBRARY_PATH=/opt/oracle/instantclient:$DYLD_LIBRARY_PATH
export OCI_LIB_DIR=/opt/oracle/instantclient
export OCI_INC_DIR=/opt/oracle/instantclient/sdk/include

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/mcbridem/.gvm/bin/gvm-init.sh" ]] && source "/Users/mcbridem/.gvm/bin/gvm-init.sh"
