
# dotfiles

These are my dotfiles. It's here so that I don't lose any of my setups when switching to a new machine, but you are welcome to use any and all of the stuff included. I would, however, highly recommend forking this repo and changing my user name to yours to avoid any issues. That will also allow you to add your own customizations and remove any of mine that you don't like.

## Prerequisites

**Operating system**

This setup is for macOS only. You will need to have Git and Ruby installed. macOS comes bundled with these, but you may have to install Git via Xcode if you haven't done that yet. You can do this by running:

```shell
xcode-select --install
```

You will also need to have write permissions to the `/usr` directory.

```shell
sudo chown -R `whoami` /usr
```

**Node.js**

You need to have [Node.js](https://nodejs.org/en/download) installed. This setup assumes you are running the current LTS version or higher. Download and install it from the Node website before getting started.

## Setup

Got all that? Great. Run the install script below. It will do the following:
- set your shell to fish
- install [Homebrew](http://brew.sh) if you don't already have it, or run `brew update` if you do
- install [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle) to make it easier to bulk install apps
- clone this repo into  `~/src/dotfiles` and set up your fish configs
- clone my [dotvim](https://github.com/mikemcbride/dotvim) repo into `~/src/dotvim` and set up an opinionated `.vimrc`
- install a few packages that I have aliases or functions for that will throw errors if you don't have them installed:
  - [z](http://github.com/rupa/z) - super fast way to jump around files/folders
  - [tree](http://brewformulas.org/tree) - linux `tree` command to show file structure
  - [trash-cli](http://github.com/sindresorhus/trash-cli) - a safer way to delete
  - [n](https://github.com/tj/n) - for managing multiple versions of Node.js
  - [rbenv](https://github.com/rbenv/rbenv) - for managing your Ruby versions/environment
  - [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)
- install some command line utilities:
  - ripgrep
  - wget
- install some services commonly used in development:
  - Docker
  - RabbitMQ
  - MongoDB
  - Java
- install a few desktop applications to make your life better:
  - Brave browser
  - [Insomnia](https://insomnia.rest/) for testing REST calls
  - Slack
  - [Kap](https://getkap.co/) for screen captures
  - [MongoDB Compass](https://www.mongodb.com/products/compass) for a MongoDB GUI
  - [Rectangle](https://www.rectangleapp.com/) for window management
  - [Alfred](https://alfredapp.com) for app launching and some automation

Ready to get started? Just paste the script below into your terminal and let it rip.

> **WARNING:** Please make sure you have read through the setup script so you understand what this is doing to your machine before executing this.
```
sudo curl -sSL https://raw.githubusercontent.com/mikemcbride/dotfiles/master/setup.sh | sh
```

### Additional Setup

This section is mostly just for me to remember what I still need to download/setup after running the install script.

Here are some apps that aren't available for download via Homebrew cask that you'll currently need to download manually:

- 1Password (App Store)
- Pixelmator Pro (App Store)
- Noizio (App Store)
- Sleeve
- Bartender
- Any fonts you want installed

You'll also need to create a `.extras` file in the home directory that contains things like the `PATH`

### Theme

The setup script installs iTerm2, which I use as a terminal emulator. I have an `iTerm_Profiles.json` file that you can import to load light and dark themes.

## Updating

As you make changes to the files, you can push those changes so your configs will never be lost. If you are running this to keep multiple machines in sync, you can just pull this repo down on other machines after pushing changes. Since all the files are symlinked, you won't have to re-run any scripts unless you create new files that also need to be linked. To do a backup of any Homebrew applications, you can run this command:

```sh
cd ~/src/dotfiles
brew bundle dump --force
git add .
git commit -m 'updating homebrew apps'
git push
```
