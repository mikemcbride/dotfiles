#!/bin/bash
sudo mkdir -p /usr/local/{bin,lib,include,share}
sudo chown -R $(whoami) /usr/local/{bin,lib,include,share}
rm -rf ~/.config
npm i -g empty-trash-cli fkill-cli np trash-cli convert-color-cli yarn vtop
cd ~
git clone https://github.com/mikemcbride/dotfiles.git
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap Homebrew/bundle
cd ~/dotfiles && brew bundle
rm ~/.gitconfig
stow {nvim,bat,karabiner,starship,git,zed,bin,ripgrep,zsh,fish}
go install github.com/tj/node-prune@latest
npm install
node ~/dotfiles/scripts/setDefaultApplications.js
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux new-session
tmux source-file ~/.tmux.conf
echo "press prefix-I to install tpm plugins"

