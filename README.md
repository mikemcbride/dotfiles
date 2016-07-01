# zsh

This is my zsh config. It's pretty much only here so that I don't lose any of my setups when switching to a new machine, but you are welcome to use any and all of the stuff included.


## Prerequisites

### Operating system

This setup is for macOS. It will almost certainly not work on Linux and definitely won't work on Windows. You will need to have Git and Ruby installed. macOS comes bundled with these, but you may have to install Git via Xcode if you haven't done that yet. You can also install it via Homebrew (see more below).

### SSH for GitHub

The install script will clone git repos via SSH. Make sure you're set up to do that before pushing any updates or you'll have some issues.

### NodeJS

You need to have [NodeJS](https://nodejs.org/en/download) installed.

### Homebrew

[Homebrew](http://brew.sh) needs to be installed so that we can install some dependencies. If you don't have it, you'll want it anyway. Just paste this into your terminal and you'll be set:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```


## Install

Got all that? Great. Run this install script. It will do the following:
- set your shell to zsh
- install [Prezto](https://github.com/sorin-ionescu/prezto) that I forked and modified
- clone this repo into  `~/zsh` and set up your `.zshrc`
- install a few packages that I have aliases or functions for that might throw errors when you try to source the `.zshrc`
  - [z](http://github.com/rupa/z) - super fast way to jump around files/folders
  - [tree](http://brewformulas.org/tree) - linux `tree` command to show file structure
  - [trash-cli](http://github.com/sindresorhus/trash-cli) - a safer way to delete
  - [nvm](https://github.com/creationix/nvm) - for managing multiple versions of Node.js
  - [pure](http://github.com/sindresorhus/pure) terminal theme, which is used in the config

Just paste this into your terminal:

```
curl -L https://raw.githubusercontent.com/mmcbride1007/zsh/master/install.sh | sh
```

### Theme

I built a terminal theme that works with both Terminal.app and iTerm 2, which is what I use for this. The colors work really nicely with the prompt. Head [here](http://github.com/mmcbride1007/electron-terminal-colors) for instructions on how to install that.

I also recommend checking out the font [Hack](http://sourcefoundry.org/hack/). It's an open source monospace font designed specifically for source code. It's super legit :fire: :fire:

## Updating

As you make changes to the `zshrc` or `zpreztorc`, you can push those changes to this repo (or your own) so your configs will never be lost. Simply run these commands:

```
cd ~/zsh
ga .
gcm 'These are some changes I made'
gp
```
