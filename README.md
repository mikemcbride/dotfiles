# zshrc

This is my zsh config. It's pretty much here so that I don't lose any of my setups when switching to a new machine. Installing oh-my-zsh is a pre-requisite for using this, but a lot of the stuff also applies to a .bashrc if you want to use it.

## Installation

Do this:

If you have not installed oh-my-zsh:

`curl -L http://install.ohmyz.sh | sh`

If you have, or once that's done running:

```
cd ~
rm .zshrc
git clone http://github.com/mmcbride1007/zshrc.git zshrc
mv ~/.zshrc ~/zshrc/zshrc
ln -s ~/zshrc/zshrc ~/.zshrc
```

## Updating

oh-my-zsh will automatically update itself, so you don't have to worry about that. As you make changes to the .zshrc file, you can push those changes to this repo by running:

```
cd ~/zshrc
git add .
git commit -m 'These are some changes I made'
git push
```
