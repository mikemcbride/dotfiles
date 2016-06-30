main() {
  # in case we are in bash
  zsh

  # install Prezto
  git clone --recursive https://github.com/mmcbride1007/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

  # set up Prezto
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done

  # go home
  cd ~

  # install z
  git clone https://github.com/rupa/z z

  # install the pure prompt
  npm install -g pure-prompt

  # clone the repo to get all the zsh config goodness
  git clone http://github.com/mmcbride1007/zsh.git zsh

  # get rid of some of the default files that were just created in Prezto. we will overwrite these with our own
  rm .zshrc
  rm .zpreztorc

  # create a symlink for the zshrc. zsh wants this file in your home, but we need it here for version control
  ln -s ~/zsh/zshrc ~/.zshrc

  # ditto for zpreztorc
  ln -s ~/zsh/zpreztorc ~/.zpreztorc

  # in case we are in bash...
  chsh -s /bin/zsh

  # don't make me wait! I want to use this NOW!
  source ~/.zshrc
}

main
