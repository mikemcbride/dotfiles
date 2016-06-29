# zsh

This is my zsh config. It's pretty much only here so that I don't lose any of my setups when switching to a new machine, but you are welcome to use any and all of the stuff included.

## Installation

### Prerequisites

If you have not installed oh-my-zsh, run this first:

```
curl -L http://install.ohmyz.sh | sh
```

You will also need [Homebrew](http://brew.sh) for the `zsh-syntax-highlighting` plugin. If you don't have Homebrew, you need to install this before continuing:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Configure

Once you've done all that, run this install script. This will:
- clone this repo into  `~/zsh` and set up your `.zshrc`:
- install the [Pure](http://github.com/sindresorhus/pure) theme, which is used in the config
- install the `zsh-syntax-highlighting` plugin (so it's important that you have Homebrew installed before running this!)

```
curl -L https://raw.githubusercontent.com/mmcbride1007/zsh/master/install.sh | sh
```

### Theme

I built a terminal theme that works with both Terminal.app and iTerm 2, which is what I use for this. It works really nicely with the prompt. Head [here](http://github.com/mmcbride1007/electron-terminal-colors) for instructions on how to install that.

I also recommend the [Hack font](http://sourcefoundry.org/hack/). It's an open source monospace font designed specifically for source code. It's super legit :fire: :fire:

## Updating

oh-my-zsh will automatically check for updates periodically and prompt you to upgrade when it finds one, so you don't have to worry about that (you can also check manually by running a command). As you make changes to the `.zshrc` file, you can push those changes to this repo (or your own) so your configs will never be lost. Simply run these commands:

```
cd ~/zsh
ga .
gcmsg 'These are some changes I made'
gp
```
