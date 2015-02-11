# zsh

This is my zsh config. It's pretty much only here so that I don't lose any of my setups when switching to a new machine, but you are welcome to use any and all of the stuff included. Installing oh-my-zsh is a pre-requisite for using this, but a lot of the stuff also applies to a .bashrc if you want to use it.

## Installation

If you have not installed oh-my-zsh, run this:

`curl -L http://install.ohmyz.sh | sh`

If you have, or once that's done running, do this:

```
cd ~
rm .zshrc
git clone http://github.com/mmcbride1007/zshrc.git zshrc
mv ~/.zshrc ~/zshrc/zshrc
ln -s ~/zshrc/zshrc ~/.zshrc
```

## Updating

oh-my-zsh will automatically check for updates and prompt you to upgrade when it finds one, so you don't have to worry about that. As you make changes to the .zshrc file, you can push those changes to this repo by running:

```
cd ~/zshrc
git add .
git commit -m 'These are some changes I made'
git push
```
