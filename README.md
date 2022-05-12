# dotfiles

These are my dotfiles. It's here so that I don't lose any of my setups when switching to a new machine, but you are welcome to use any and all of the stuff included. I would, however, highly recommend forking this repo and changing my user name to yours to avoid any issues. That will also allow you to add your own customizations and remove any of mine that you don't like.

## Setup

It's worth noting up front that this setup assumes you're using `bash` or `zsh`. We'll install `fish`, but all the install commands would be run on a fresh system, so it's one of those shells. It's also worth noting that this setup is for macOS only.

One other important thing to note is that the Homebrew install location is different for Apple Silicon macs vs Apple Intel macs:

| Apple Silicon | Intel |
| --- | --- |
| `/opt/homebrew` | `/usr/local` |

You can set that prefix as an ENV variable if that would make things easier. For now, I'm going to assume Apple Silicon since they're phasing out the Intel macs, but just know that if you're using an Intel mac the Homebrew prefix is different so you'll need to tweak some of the scripts. I'll try to remember to make a note below.

### Prerequisites

**Operating system**

You will need to have Git and Ruby installed. macOS comes bundled with these, but you may have to install Git via Xcode if you haven't done that yet. You can do this by running:

```shell
xcode-select --install
```

You will need write permissions to various folders in the `/usr` directory for the things we're going to install. Run this to grant yourself those permissions:

```shell
sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
```

If any of those directories don't exist, you can create them and then re-run that command. Create them like this:

```shell
sudo mkdir -p /usr/local/{dirname}
```

We'll also end up creating a new folder for `n`, which we use to manage Node versions. Let's go ahead and create that and set up permissions so we don't have to fiddle with it later:

```shell
sudo mkdir -p /usr/local/n
sudo chown -R $(whoami) /usr/local/n
```

**Node.js**

You need to have [Node.js](https://nodejs.org/en/download) installed. This setup assumes you are running the current LTS version or higher. Download and install it from the Node website before moving on.

**1Password**

It's pretty helpful to have 1Password set up before doing a lot of this stuff so you can log in easily. Totally optional, you can do it later if you want. But signing in to your Apple ID, GitHub, etc is easier than typing those long passwords manually.

### Scripts

We'll start in the home directory. If we have any existing configuration files, we need to kill those.

```sh
cd ~
rm -rf ~/.config/fish
rm -rf ~/.config/fisherman
```

Next we'll install [Homebrew](http://brew.sh). If you already have it, run `brew update` instead of installing it:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

We'll use Homebrew Bundle to look at our Bundle file and install a bunch of stuff:

```sh
brew tap Homebrew/bundle
```

Now we're going to install some global node modules that we'll use to accomplish various things:

```sh
npm i -g diff-so-fancy empty-trash-cli fkill-cli np trash-cli convert-color-cli yarn
```

Now that we've got all that installed, we'll set up the dotfiles:

```sh
mkdir -p ~/src && cd ~/src
git clone https://github.com/mikemcbride/dotfiles.git
```

Now we're going to set up a bunch of symlinks to link things from this repo to the user directory:

```sh
# make sure ~/.config exists
mkdir -p ~/.config

# make sure we don't have an existing .gitconfig
rm ~/.gitconfig

# now we can safely set up symlinks
ln -s ~/src/dotfiles ~/dotfiles
ln -s ~/src/dotfiles/fish ~/.config/fish
ln -s ~/src/dotfiles/nvim ~/.config/nvim
ln -s ~/src/dotfiles/bat ~/.config/bat
ln -s ~/src/dotfiles/starship.toml ~/.config/starship.toml
ln -s ~/src/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/src/dotfiles/.gitignore.global ~/.gitignore.global
ln -s ~/src/dotfiles/zed ~/.zed
```

Now we're going to install all the Homebrew applications:

```sh
cd ~/src/dotfiles && brew bundle
```

We'll install `fisher`, a plugin manager for the `fish` shell:

```sh
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

We'll also install a GO binary that's used in some scripts:

```sh
go get github.com/tj/node-prune
```

Now we've got some dependencies to install for those utility scripts to work. Let's do that now:

```sh
cd ~/src/dotfiles
yarn install
```

While we're in here, we probably want to set our file handling for common code file extensions to all open in VS Code instead of whatever the OS decides to use to open the files:

```sh
cd ~/src/dotfiles
node ./scripts/setDefaultApplications.js
```

Next we need to add `fish` to our list of available shells, then we'll switch to using it:

```sh
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```

If we're on an Apple Silicon Mac, we need to add a couple of directories to our `$PATH` so we can execute binaries installed via Homebrew. We'll also add our Go binaries path so anything we install with `go get` will be available to us as well (for starters, `node-prune`).

```sh
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew
fish_add_path (go env GOPATH)/bin
```

Finally, we'll install any plugins with fisher:

```sh
fisher install fisherman/z
fisher install fisherman/rbenv
```

## What just happened?

Got all that working? Great. Here's what we did:
- set your shell to fish
- installed [Homebrew](http://brew.sh)
- installed [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle) to make it easier to bulk install apps
- cloned this repo into  `~/src/dotfiles` and set up your fish configs
- installed [starship](https://starship.rs) for managing our terminal prompt and set up a config for that
- set up Neovim config
- installed a few packages that I have aliases or functions for that will throw errors if you don't have them installed:
  - [z](http://github.com/rupa/z) - super fast way to jump around files/folders
  - [tree](http://brewformulas.org/tree) - linux `tree` command to show file structure
  - [trash-cli](http://github.com/sindresorhus/trash-cli) - a safer way to delete
  - [n](https://github.com/tj/n) - for managing multiple versions of Node.js
  - [rbenv](https://github.com/rbenv/rbenv) - for managing your Ruby versions/environment
  - [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) - the fanciest diffs
- installed some command line utilities:
  - ripgrep - grep but like a million times better
  - bat - a `cat` clone with awesome features
  - wget
- installed some services commonly used in development:
  - Docker
  - RabbitMQ
  - MongoDB
- installed a few desktop applications to make your life better:
  - Firefox
  - Brave browser
  - iTerm
  - [Raycast](https://raycast.com)
  - [Insomnia](https://insomnia.rest/) for testing REST calls
  - Slack
  - [Kap](https://getkap.co/) for screen captures
  - [MongoDB Compass](https://www.mongodb.com/products/compass) for a MongoDB GUI
  - DBeaver Community Edition for working with relational databases

## Additional Setup

This section is mostly just for me to remember what I still need to download/setup after running the install script.

### Logins

- Sign in to 1Password and add the browser extension.
- Set Firefox as your default browser and log in to sync bookmarks/preferences.
- You'll need to set up a new GitHub Personal Access Token to access GitHub from the command line.
- Open any file in vim and run `:PackerInstall` to install all plugins
- Sign in to VS Code Settings Sync to bring over settings and extensions.

### Raycast

In this repo there's a `/raycast/[file].rayconfig` that you can import to bring over all your Raycast preferences.

### More Apps to Install

Here are some apps that aren't available for download via Homebrew cask that you'll currently need to download manually:

- 1Password (App Store) if you didn't do it before
- Pixelmator Pro (App Store)
- Bartender (website)
- Battery Indicator (App Store)
- Any fonts you want installed (grab Fonts folder from iCloud)

### Theme

The setup script installs iTerm2, which I use as a terminal emulator. This repo has an `iterm/profiles.json` file that you can import to load a bunch of themes. Vim theme is already set up with the process above.

### Browser Extensions

Reinstall browser extensions. For Firefox, just sign in to your Firefox account and it will sync them. Export the bookmarks file and import into any other browser you want.

## Updating

As you make changes to the files, you can push those changes so your configs will never be lost. If you are running this to keep multiple machines in sync, you can just pull this repo down on other machines after pushing changes. Since all the files are symlinked, you won't have to re-run any scripts unless you create new files that also need to be linked. To do a backup of any Homebrew applications, you can run this command:

```sh
cd ~/src/dotfiles
brew bundle dump --force
git add .
git commit -m 'updating homebrew apps'
git push
```
