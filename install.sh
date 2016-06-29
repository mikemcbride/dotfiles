main() {
  # get to the home directory
  cd ~

  # if you have an existing .zshrc file, get rid of it
  rm .zshrc

  # clone the repo to get all the zsh goodness
  git clone http://github.com/mmcbride1007/zsh.git zsh

  # create a symlink for the zshrc. zsh wants this file in your home, but we need it here for version control
  ln -s ~/zsh/zshrc ~/.zshrc

  # install the pure prompt
  npm install -g pure-prompt

  # install the zsh-syntax-highlighting plugin
  brew install zsh-syntax-highlighting
}

main
