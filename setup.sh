main() {
  echo "Switching to zsh"
  zsh
  
  # go home
  echo "Going home..."
  cd ~

  # if they have a .zshrc, kill it
  echo "Removing any existing .zshrc config..."
  rm .zshrc

  # try to install z
  if [[ ! -d ~/z ]]; then
    echo "Installing z..."
    git clone https://github.com/rupa/z.git z
  fi

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

  # Install Homebrew Bundle
  echo "Installing Homebrew Bundle"
  brew tap Homebrew/bundle

  # install global node modules
  echo "Installing some global npm modules..."
  npm i -g @vue/cli diff-so-fancy empty-trash-cli fkill-cli grunt-cli gulp n node-prune np poi trash-cli vtop

  echo "Now for some dotfile magic."

  # if ~/src does not exist, create it
  if [ ! -d ~/src ]; then
    echo "Creating ~/src..."
    mkdir ~/src
  fi

  # cd into ~/src to clone git repos
  echo "Heading over to ~/src to clone some repos..."
  cd ~/src

  # clone the repo to get all the dotfile goodness
  echo "Cloning dotfiles..."
  git clone https://github.com/mmcbride1007/dotfiles.git

  # install Prezto
  echo "Cloning Prezto..."
  git clone --recursive https://github.com/mmcbride1007/prezto.git
  
  # clone vim config.
  # .vimrc will be symlinked with the other symlinks below.
  echo "Cloning dotvim..."
  git clone http://github.com/mmcbride1007/dotvim.git
  
  echo "Heading into dotvim..."
  cd ~/src/dotvim
  
  echo "Initiating git submodules..."
  git submodule init
  git submodule update
  
  echo "Done in dotvim, heading back to ~/src"
  cd ~/src

  # symlink ~/src/dotfiles to ~/dotfiles to make it easier to manage
  # symlink some files from ~/dotfiles to ~/prezto for the setup
  # we want all our version controlled configs in ~/dotfiles.
  # ~/prezto is just a facade, but Prezto expects certain things to be in that location
  echo "Setting up symlinks..."
  
  # first we have to remove some files that already exist in prezto
  rm ~/src/prezto/runcoms/zpreztorc
  rm ~/src/prezto/runcoms/zshrc
  
  # and if there's an existing vimrc, kill it
  rm ~/.vimrc
  
  # now we can safely set up symlinks
  ln -s ~/src/dotfiles ~/dotfiles
  ln -s ~/dotfiles/zpreztorc ~/src/prezto/runcoms/zpreztorc
  ln -s ~/dotfiles/zshrc ~/src/prezto/runcoms/zshrc
  ln -s ~/src/prezto ~/.zprezto
  ln -s ~/src/dotvim ~/.vim
  ln -s ~/.vim/vimrc ~/.vimrc

  if [ -f ~/.gitconfig ]; then
    echo "Overriding .gitconfig..."
    rm ~/.gitconfig
  fi

  ln -s ~/dotfiles/.aliases ~/.aliases
  ln -s ~/dotfiles/.functions ~/.functions
  ln -s ~/dotfiles/.exports ~/.exports
  ln -s ~/dotfiles/.gitconfig ~/.gitconfig
  ln -s ~/dotfiles/.gitignore.global ~/.gitignore.global

  # install homebrew applications
  echo "Installing applications via Homebrew and Cask..."
  cd ~/src/dotfiles
  brew bundle

  echo "Done installing command utility and desktop applications."
  
  # install dependencies required for some scripts in dotfiles to work
  echo "Installing dependencies..."
  yarn install

  if [ -f ~/.hyper.js ]; then
    echo "Overriding .hyper.js..."
    rm ~/.hyper.js
  fi
  
  ln -s ~/dotfiles/.hyper.js ~/.hyper.js

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
