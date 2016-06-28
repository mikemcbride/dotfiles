# zsh

This is my zsh config. It's pretty much only here so that I don't lose any of my setups when switching to a new machine, but you are welcome to use any and all of the stuff included.

## Installation

### Prerequisites

If you have not installed oh-my-zsh, run this:

```
curl -L http://install.ohmyz.sh | sh
```

You will also need [Homebrew](http://brew.sh) for the `zsh-syntax-highlighting` plugin. If you don't have Homebrew, you need to install this now:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Configure

Once you've done all that, run this install script. This will:
- clone this repo into  `~/zsh` and set up your `.zshrc`:
- install the [Pure](/sindresorhus/pure) theme, which is used in the config
- install the `zsh-syntax-highlighting` plugin (so it's important that you have Homebrew installed before running this!)

```
curl -L https://raw.githubusercontent.com/mmcbride1007/zsh/master/install.sh | sh
```

## Updating

oh-my-zsh will automatically check for updates and prompt you to upgrade when it finds one, so you don't have to worry about that. As you make changes to the .zshrc file, you can push those changes to this repo (or your own) so your configs will never be lost. Simply run these commands:

```
cd ~/zsh
ga .
gcmsg 'These are some changes I made'
gp
```
