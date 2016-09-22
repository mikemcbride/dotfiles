# Source Prezto
if [[ -s ~/.zprezto/init.zsh ]]; then
  source ~/.zprezto/init.zsh
fi

# use z for better fuzzy searching
if [[ -s ~/z/z.sh ]]; then
	source ~/z/z.sh
fi

# source aliases
if [[ -f ~/dotfiles/.aliases ]]; then
  source ~/dotfiles/.aliases
fi

# source functions
if [[ -f ~/dotfiles/.functions ]]; then
  source ~/dotfiles/.functions
fi
