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
  ln -s ~/.zprezto/runcoms/zlogin ~/.zlogin
  ln -s ~/.zprezto/runcoms/zlogout ~/.zlogout
  ln -s ~/.zprezto/runcoms/zpreztorc ~/.zpreztorc
  ln -s ~/.zprezto/runcoms/zprofile ~/.zprofile
  ln -s ~/.zprezto/runcoms/zshenv ~/.zshenv
  ln -s ~/.zprezto/runcoms/zshrc ~/.zshrc

  # in case we are in bash...
  chsh -s /bin/zsh

  # don't make me wait! I want to use this NOW!
  source ~/.zshrc
}

main
