main() {
  cd ~
  rm .zshrc
  git clone http://github.com/mmcbride1007/zsh.git zsh-test
  mv ~/.zshrc ~/zsh/zshrc
  ln -s ~/zsh/zshrc ~/.zshrc
}

main
