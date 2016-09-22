main() {
  # in case we are in bash
  echo "Switching to zsh..."
  zsh

  # go home
  echo "Going home..."
  cd ~

  # if they have a .zshrc, kill it
  echo "Removing any existing .zshrc config..."
  rm .zshrc

  # install z
  echo "Installing z..."
  git clone git@github.com:rupa/z.git z

  # install or update Homebrew
  echo "Checking for existing Homebrew installation..."
  which -s brew
  if [[ $? != 0 ]] ; then
      echo "Installing Homebrew..."
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo "Updating Homebrew..."
    brew update
  fi

  # make sure Homebrew Cask is installed
  echo "Installing Cask..."
  brew tap caskroom/cask

  # install tree
  echo "Installing tree..."
  brew install tree

  # install Hyperterm
  echo "Installing Hyperterm..."
  brew cask install hyperterm

  # install global node modules
  echo "Installing n and trash-cli..."
  npm install --global n trash-cli

  # if ~/github does not exist, create it
  if [ ! -d ~/github ]; then
    echo "Creating ~/github..."
    mkdir ~/github
  fi

  # cd into ~/github to clone git repos
  echo "Heading over to ~/github to clone some repos..."
  cd ~/github

  # clone the repo to get all the dotfile goodness
  echo "Cloning dotfiles..."
  git clone git@github.com:mmcbride1007/dotfiles.git dotfiles

  # install Prezto
  echo "Cloning Prezto..."
  git clone --recursive git@github.com:mmcbride1007/prezto.git prezto

  # symlink ~/github/dotfiles to ~/dotfiles to make it easier to manage
  # symlink some files from ~/dotfiles to ~/prezto for the setup
  # we want all our version controlled configs in ~/dotfiles.
  # ~/prezto is just a facade, but Prezto expects certain things to be in that location
  echo "Setting up symlinks..."
  ln -s ~/github/dotfiles ~/dotfiles
  ln -s ~/dotfiles/.gitconfig ~/.gitconfig
  ln -s ~/dotfiles/.hyperterm.js ~/.hyperterm.js
  ln -s ~/dotfiles/zpreztorc ~/github/prezto/runcoms/zpreztorc
  ln -s ~/dotfiles/zshrc ~/github/prezto/runcoms/zshrc
  ln -s ~/github/prezto ~/.zprezto

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

  # don't make me wait! I want to use this ASAP
  echo "Sourcing .zshrc..."
  source ~/.zshrc

  # let them know what to do
  echo "All done! Open a new tab or window to start using your new shell."
}

main
