# Source Prezto.
if [[ -s ~/.zprezto/init.zsh ]]; then
  source ~/.zprezto/init.zsh
fi

# use z for better fuzzy searching
source ~/z/z.sh

# Git
alias gmm="git merge master"
alias gf="git fetch --all --prune"
alias pull="git pull"
alias ga="git add"
alias gcm="git checkout master"
alias gcam="git commit -am"
alias gs="git status"
alias glg="git log --graph --decorate --pretty=oneline --abbrev-commit --all"
alias clone="git clone"

function gpub() {
  local current_branch=git_current_branch()
  git push --set-upstream origin $current_branch:$current_branch
}

# NPM
alias use_npm="npm set registry https://registry.npmjs.org/"
alias use_wwt="npm set registry http://sinopia.wwt.com/"

# start screensaver
alias afk="sh ~/zsh/scripts/screensaver.sh"

# get current weather
alias weather="curl wttr.in"

# start/stop tomcat server
alias tomcat_start="/Library/Tomcat/bin/startup.sh"
alias tomcat_stop="/Library/Tomcat/bin/shutdown.sh"

# other aliases
alias k="clear"
alias x="exit"
alias ltr="ls -ltr"
alias vi=vim # prefer vim to vi
alias ...="../.."
alias ....="../../.."
alias .....="../../../.."
alias rm=trash # safer deleting using trash-cli
alias please=sudo # nicer sudo command
alias ab="atom-beta ."
alias resource="source ~/.zshrc"
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
  builtin cd $@ && ls -la
}

# running take $dirName will make a directory of that name and cd into it
function take() {
  mkdir $@ && cd $@
}

# current git branch
function git_current_branch() {
  if ! git rev-parse 2> /dev/null; then
    print "$0: not a repository: $PWD" >&2
    return 1
  fi

  local ref="$(git symbolic-ref HEAD 2> /dev/null)"

  if [[ -n "$ref" ]]; then
    print "${ref#refs/heads/}"
    return 0
  else
    return 1
  fi
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
export SDKMAN_DIR="~/.sdkman"
[[ -s "~/.sdkman/bin/sdkman-init.sh" ]] && source "~/.sdkman/bin/sdkman-init.sh"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
