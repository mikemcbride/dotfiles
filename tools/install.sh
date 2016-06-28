main() {
  cd ~
  rm .zshrc
  git clone http://github.com/mmcbride1007/zsh.git zsh
  ln -s ~/zsh/zshrc ~/.zshrc
}

main
