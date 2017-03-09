# dotfiles

These are my dotfiles. It's here so that I don't lose any of my setups when switching to a new machine, but you are welcome to use any and all of the stuff included.

## Prerequisites

#### Operating system

This setup is for macOS. If you want this on Linux, use the provided Linux install script, which omits some macOS specific things. It definitely won't work on Windows, sorry. You will need to have Git and Ruby installed. macOS comes bundled with these, but you may have to install Git via Xcode if you haven't done that yet. You can also install it via Homebrew (see more below).

#### SSH for GitHub

The setup script will clone git repos via SSH (Linux script will clone via HTTP in case its a server). Make sure you're set up to do that before pushing any updates or you'll have some issues.

#### Node

You need to have [Node](https://nodejs.org/en/download) installed. I'd suggest making sure you are on a current version prior to executing the install script.

## Setup

Got all that? Great. Run this install script. It will do the following:
- set your shell to zsh
- install [Prezto](https://github.com/sorin-ionescu/prezto) that I forked and modified
- install [Homebrew](http://brew.sh) if you don't already have it, or run `brew update` if you do
- install [Homebrew Cask](https://caskroom.github.io/) (again, if you already have it, this won't do anything)
- clone this repo into  `~/github/dotfiles` and set up your `.zshrc`
- install a few packages that I have aliases or functions for that will throw errors when you try to source the `.zshrc`
  - [z](http://github.com/rupa/z) - super fast way to jump around files/folders
  - [tree](http://brewformulas.org/tree) - linux `tree` command to show file structure
  - [trash-cli](http://github.com/sindresorhus/trash-cli) - a safer way to delete
  - [n](https://github.com/tj/n) - for managing multiple versions of Node.js
  - [rbenv](https://github.com/rbenv/rbenv) - for managing your Ruby versions/environment
  - [Hack](http://sourcefoundry.org/hack/) - an open source monospace font designed specifically for source code. It's :fire:
- install a few desktop applications to make your life better:
  - Google Chrome
  - [Hyper](https://hyper.is) as a terminal replacement (and set up an opinionated `.hyper.js` config file)
  - [Postman](https://www.getpostman.com/) for testing REST calls
  - Slack
  - Spotify
  - [Kap](https://getkap.co/) for screen captures
  - Robomongo (helpful for managing MongoDB collections outside of the terminal)
  - [Spectacle](https://www.spectacleapp.com/) for window management
  - [Rocket](https://matthewpalmer.net/rocket/) for quick and easy emoji access
  - LastPass for password vault
  - [Nylas Mail](https://nylas.com) as a desktop email client

Ready to get started?? Just paste this into your terminal. **WARNING:** Please make sure you have read through the setup script so you understand what this is doing before executing this.

```
curl -L https://raw.githubusercontent.com/mmcbride1007/dotfiles/master/setup.sh | sh
```

**For Linux users:**

```
curl -L https://raw.githubusercontent.com/mmcbride1007/dotfiles/master/linux_setup.sh | sh
```

### Additional App Setup

This part is mostly just for me to remember what I still need to download.

Here are some apps that aren't available for download via Homebrew cask (yet) that you'll currently need to download manually:

- Atom Beta (stable is available via cask, not beta)
- Pixelmator
- Noizio
- Tweetbot

### Theme

The setup script installs Hyper, which I highly recommend. It also sets up a config file for Hyper that includes a custom theme that I built. If you prefer to use Terminal.app or iTerm2, I have the same theme available for those applications. [Head over here](http://github.com/mmcbride1007/electron-terminal-colors) for instructions on how to install them.

## Updating

As you make changes to the files, you can push those changes so your configs will never be lost. If you are running this to keep multiple machines in sync, you can just pull this repo down on other machines after pushing changes. Since all the files are symlinked, you won't have to re-run any scripts unless you create new files that also need to be linked.

## Other Goodies

For a new Mac setup, I copied the legendary script from @mathiasbynens. The canonical version lives [here](). I have removed and changed some things according to my own preferences. To get those defaults, simply `cd` into the dotfiles directory and execute the `.macos` file as seen below. **NOTE: I highly recommend reading through this before executing the script. Please make sure you know what it is doing to your machine.**

```
sh .macos
```
