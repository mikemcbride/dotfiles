sudo mkdir -p /usr/local/{bin,lib,include,share}
sudo chown -R $(whoami) /usr/local/{bin,lib,include,share}

cd ~
rm -rf ~/.config

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew tap Homebrew/bundle

npm i -g empty-trash-cli fkill-cli np trash-cli convert-color-cli yarn

cd ~
git clone https://github.com/mikemcbride/dotfiles.git

cd ~/dotfiles
brew bundle

mkdir -p ~/.zed
rm ~/.gitconfig
stow fish
stow nvim
stow bat
stow karabiner
stow starship
stow git
stow zed

go get github.com/tj/node-prune

cd ~/dotfiles
yarn install
node ./scripts/setDefaultApplications.js

echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew
fish_add_path (go env GOPATH)/bin

gh completion -s fish > ~/.config/fish/completions/gh.fish
fisher install jethrokuan/z
fisher install rbenv/fish-rbenv
