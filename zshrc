# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mike"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git atom)

source $ZSH/oh-my-zsh.sh

# use z for better fuzzy searching
source ~/z/z.sh

# Git
alias pull="git pull"
alias push="git push"
alias gmm="git merge master"
alias gf="git fetch --all --prune"

# NPM
alias set_registry_npm="npm set registry https://registry.npmjs.org/"
alias set_registry_wwt="npm set registry http://sinopia.wwt.com/"

# start screensaver
alias afk="sh ~/zsh/scripts/screensaver.sh"

# other aliases
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
alias ab="atom-beta ."
alias resource="source ~/.zshrc"
alias tmux="TERM=screen-256color tmux"
alias update_vim_plugins="cd ~/.vim && git submodule foreach git pull origin master"
alias ssh_cvharris="ssh 50.116.21.75"
alias wwt="cd ~/wwt"
alias tomcat_start="/Library/Tomcat/bin/startup.sh"
alias tomcat_stop="/Library/Tomcat/bin/shutdown.sh"
alias fs_apps="cd ~/wwt/ServiceNow/filesync/"
alias filesync="/Applications/ServiceNow/filesync/filesync.command;"
alias filesync_all='for f in $(find ~/wwt/ServiceNow/filesync -name "*" -type f); do cat /dev/null | tee "$f"; done;'
alias filesync_this='for f in $(find . -name "*" -type f); do cat /dev/null | tee "$f"; done;'
export PATH="~/.node/bin:~/.rvm/gems/ruby-2.1.4/bin:~/.rvm/gems/ruby-2.1.4@global/bin:~/.rvm/rubies/ruby-2.1.4/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/local/mysql/bin:~/.rvm/bin"

# use nvm
export NVM_DIR=~/.nvm
if [ -s "$NVM_DIR/nvm.sh" ]; then
  source "$NVM_DIR/nvm.sh"
fi
NODE_DEFAULT_VERSION=$(<"$NVM_DIR/alias/default")
export PATH="$NVM_DIR/versions/node/$NODE_DEFAULT_VERSION/bin":$PATH

# print contents of directory immediately when switching
function cd(){
  emulate -L zsh
  builtin cd $@ &&
  ls -la
}

# function to generate a bitly url and copy to clipboard
function bitly(){
python ~/zsh/scripts/bitly.py $1 | tee >(pbcopy)
}

function replace_ext {
  for f in *.$1; do 
    mv -- "$f" "${f%.$1}.$2"
  done
}

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "~/.gvm/bin/gvm-init.sh" ]] && source "~/.gvm/bin/gvm-init.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="~/.sdkman"
[[ -s "~/.sdkman/bin/sdkman-init.sh" ]] && source "~/.sdkman/bin/sdkman-init.sh"
