main() {
  # in case we are in bash
  zsh

  # go home
  cd ~

  # if they have a .zshrc, kill it
  rm .zshrc

  # clone the repo to get all the zsh config goodness
  git clone http://github.com/mmcbride1007/zsh.git zsh

  # install z
  git clone https://github.com/rupa/z z

  # ditto for zpreztorc
  ln -s ~/zsh/zpreztorc ~/.zpreztorc

  # in case we are in bash...
  chsh -s /bin/zsh

  # install Prezto
  git clone --recursive https://github.com/mmcbride1007/prezto.git  ~/prezto

  # create a symlink for .zprezto
  ln -s ~/prezto "${ZDOTDIR:-$HOME}/.zprezto"

  # symlink some files from ~/zsh to ~/prezto for the setup
  ln -s ~/zsh/zpreztorc ~/prezto/zpreztorc
  ln -s ~/zsh/zshrc ~/prezto/zshrc

  # set up Prezto
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done

  # in case we are in bash...
  chsh -s /bin/zsh

  # don't make me wait! I want to use this NOW!
  source ~/.zshrc
}

main
