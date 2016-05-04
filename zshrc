# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

autoload -U promptinit && promptinit
prompt pure

ZSH_THEME="pure-alt"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# use z for better fuzzy searching
source ~/z/z.sh

# Git
alias pull="git pull"
alias push="git push"
alias gmm="git merge master"
alias gf="git fetch --all --prune"
alias gs="git status"
alias glg="git log --graph --decorate --pretty=oneline --abbrev-commit --all"
alias clone="git clone"

# NPM
alias use_npm="npm set registry https://registry.npmjs.org/"
alias use_wwt="npm set registry http://sinopia.wwt.com/"

# start screensaver
alias afk="sh ~/zsh/scripts/screensaver.sh"

# get current weather
alias weather="curl wttr.in"

# other aliases
alias k="clear"
alias x="exit"
alias ltr="ls -ltr"
alias vi=vim
alias ...="../.."
alias ....="../../.."
alias .....="../../../.."
alias rm=trash # safer deleting using trash-cli
alias please=sudo
alias ab="atom-beta ."
alias resource="source ~/.zshrc"
alias update_vim_plugins="cd ~/.vim && git submodule foreach git pull origin master"
alias ssh_cvharris="ssh 50.116.21.75"
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

# tree
function t() {
  tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst --filelimit 15 -L ${1:-3} -aC $2
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
export JENV_ROOT=/usr/local/opt/jenv

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/mcbridem/.sdkman"
[[ -s "/Users/mcbridem/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/mcbridem/.sdkman/bin/sdkman-init.sh"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
