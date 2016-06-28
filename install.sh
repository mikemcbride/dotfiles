main() {
  cd ~
  rm .zshrc
  git clone http://github.com/mmcbride1007/zsh.git zsh
  ln -s ~/zsh/zshrc ~/.zshrc
  npm install -g pure-prompt
  brew install zsh-syntax-highlighting
}

main
