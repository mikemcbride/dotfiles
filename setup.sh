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

rm ~/.gitconfig
stow zsh
stow nvim
stow bat
stow karabiner
stow starship
stow git
stow zed

go get github.com/tj/node-prune

cd ~/dotfiles
npm install
node ./scripts/setDefaultApplications.js

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
gh completion -s zsh > /usr/local/share/zsh/site-functions/_gh
chsh -s $(which zsh)
source ~/.zshrc
