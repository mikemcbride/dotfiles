main() {
  # in case we are in bash
  echo "Switching to zsh..."
  zsh

  # go home
  cd ~

  # if they have a .zshrc, kill it
  echo "Removing any existing .zshrc config..."
  rm .zshrc

  # install z
  echo "Installing z..."
  git clone git@github.com:rupa/z.git z

  # install tree
  echo "Installing tree..."
  brew install tree

  # install nvm, pure, trash-cli
  echo "Installing nvm, pure, and trash-cli..."
  npm install --global nvm pure-prompt trash-cli

  # clone the repo to get all the zsh config goodness
  echo "Cloning zsh repo..."
  git clone git@github.com:mmcbride1007/zsh.git zsh

  # install Prezto
  echo "Cloning Prezto config..."
  git clone --recursive git@github.com:mmcbride1007/prezto.git prezto

  # symlink some files from ~/zsh to ~/prezto for the setup
  # we want all our version controlled configs in ~/zsh
  echo "Setting up symlinks..."
  ln -s ~/zsh/zpreztorc ~/prezto/runcoms/zpreztorc
  ln -s ~/zsh/zshrc ~/prezto/runcoms/zshrc

  # create a symlink for .zprezto
  ln -s ~/prezto ~/.zprezto

  # set up Prezto
  echo "Setting up Prezto config files..."
  ln -s ~/.zprezto/runcoms/zlogin ~/.zlogin
  ln -s ~/.zprezto/runcoms/zlogout ~/.zlogout
  ln -s ~/.zprezto/runcoms/zpreztorc ~/.zpreztorc
  ln -s ~/.zprezto/runcoms/zprofile ~/.zprofile
  ln -s ~/.zprezto/runcoms/zshenv ~/.zshenv
  ln -s ~/.zprezto/runcoms/zshrc ~/.zshrc

  # in case we are in bash...
  echo "Changing shell to zsh..."
  chsh -s /bin/zsh

  # don't make me wait! I want to use this NOW!
  echo "Sourcing .zshrc..."
  source ~/.zshrc

  # let them know what to do
  echo "All done! Open a new tab or window to start using your new shell."
}

main
