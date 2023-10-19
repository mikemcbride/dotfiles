#!/bin/bash
sudo mkdir -p /usr/local/{bin,lib,include,share}
sudo chown -R $(whoami) /usr/local/{bin,lib,include,share}
npm i -g empty-trash-cli fkill-cli np trash-cli convert-color-cli yarn vtop
mkdir -p ~/personal
cd ~/personal
git clone https://github.com/mikemcbride/dotfiles.git
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap Homebrew/bundle
cd ~/personal/dotfiles && brew bundle
rm ~/.gitconfig
stow -t ~ {nvim,bat,karabiner,starship,git,zed,bin,ripgrep,fish,zsh,tmux,ytdl}
go install github.com/tj/node-prune@latest
npm install
node ~/personal/dotfiles/scripts/setDefaultApplications.js
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux new-session
tmux source-file ~/.tmux.conf
echo "press prefix-I to install tpm plugins"

