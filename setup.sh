main() {
  # we are going to need to be sudo for some stuff later on.
  # ask for permission right away.
  if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
  fi
  
  # go home
  echo "Going home..."
  cd ~

  # if they have a .config/fish, kill it
  echo "Removing any existing fish configuration..."
  rm -rf ~/.config/fish

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
  git clone https://github.com/mikemcbride/dotfiles.git
  
  # clone vim config.
  # .vimrc will be symlinked with the other symlinks below.
  echo "Cloning dotvim..."
  git clone http://github.com/mikemcbride/dotvim.git
  
  echo "Heading into dotvim..."
  cd ~/src/dotvim
  
  echo "Initiating git submodules..."
  git submodule init
  git submodule update
  
  echo "Done in dotvim, heading back to ~/src"
  cd ~/src

  # symlink ~/src/dotfiles to ~/dotfiles to make it easier to manage
  # we want all our version controlled configs in ~/dotfiles.
  echo "Setting up symlinks..."
  
  # if there's an existing vimrc, kill it
  rm ~/.vimrc
  
  # now we can safely set up symlinks
  ln -s ~/src/dotfiles ~/dotfiles
  ln -s ~/src/dotvim ~/.vim
  ln -s ~/.vim/vimrc ~/.vimrc
  ln -s ~/src/dotfiles/fish ~/.config/fish

  if [ -f ~/.gitconfig ]; then
    echo "Overriding .gitconfig..."
    rm ~/.gitconfig
  fi

  ln -s ~/dotfiles/.gitconfig ~/.gitconfig
  ln -s ~/dotfiles/.gitignore.global ~/.gitignore.global

  # install homebrew applications
  echo "Installing applications via Homebrew and Cask..."
  cd ~/src/dotfiles
  brew bundle
  
  # install fisher for managing fish plugins
  echo "Installing fisher..."
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

  echo "Done installing command utility and desktop applications."
  
  # install dependencies required for some scripts in dotfiles to work
  echo "Installing dependencies..."
  yarn install

  if [ -f ~/.hyper.js ]; then
    echo "Overriding .hyper.js..."
    rm ~/.hyper.js
  fi
  
  echo "Setting up Hyper config..."
  ln -s ~/dotfiles/.hyper.js ~/.hyper.js
  
  # add fish to our available list of shells we can use
  echo "Adding fish to list of available shells..."
  echo /usr/local/bin/fish | sudo tee -a /etc/shells

  # switch to fish! I wanna use this immediately!
  echo "Changing shell to fish..."
  chsh -s /usr/local/bin/fish
  
  # this only works once we have changed the shell to be fish.
  echo "Installing fisher plugins..."
  fisher

  # let them know what to do
  echo "All done! Open a new tab or window to start using your new shell."
}

main
