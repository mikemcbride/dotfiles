# dotfiles

These are my dotfiles. It's here so that I don't lose any of my setups when switching to a new machine, but you are welcome to use any and all of the stuff included. I would, however, highly recommend forking this repo and changing my user name to yours to avoid any issues. That will also allow you to add your own customizations and remove any of mine that you don't like.

## Setup

It's worth noting up front that this setup assumes you're using `bash` or `zsh`. We'll install `fish`, but all the install commands would be run on a fresh system, so it's one of those shells. It's also worth noting that this setup is for macOS only.

One other important thing to note is that the Homebrew install location is different for Apple Silicon macs vs Apple Intel macs:

| Apple Silicon   | Intel        |
| --------------- | ------------ |
| `/opt/homebrew` | `/usr/local` |

You can set that prefix as an ENV variable if that would make things easier. For now, I'm going to assume Apple Silicon since they're phasing out the Intel macs, but just know that if you're using an Intel mac the Homebrew prefix is different so you'll need to tweak some of the scripts. I'll try to remember to make a note below.

### Prerequisites

**Operating system**

We need git and some other stuff that the Apple command line tools provides:

```shell
xcode-select --install
```

We will need write permissions to various folders in the `/usr/local` directory for the things we're going to install. We'll make sure they exist first. Run this to grant yourself those permissions:

```shell
sudo mkdir -p /usr/local/{bin,lib,include,share}
sudo chown -R $(whoami) /usr/local/{bin,lib,include,share}
```

**1Password**

It's pretty helpful to have 1Password set up before doing a lot of this stuff so you can log in easily. Totally optional, you can do it later if you want. But signing in to your Apple ID, GitHub, etc is easier than typing those long passwords manually.

**Node.js**

You need to have [Node.js](https://nodejs.org/en/download) installed. If you really are opposed to doing this you can install it with Homebrew. This setup assumes you are running the current LTS version or higher. Download and install it from the Node website before moving on.

### Scripts

We'll start in the home directory. If we have any existing configuration files, we need to kill those. Ideally we don't have a `~/.config` directory, but if so... you probably need to delete it. Store your existing configs somewhere else for the time being and re-apply afterwards.

```sh
cd ~
rm -rf ~/.config
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
npm i -g empty-trash-cli fkill-cli np trash-cli convert-color-cli yarn
```

Now that we've got all that installed, we'll set up the dotfiles:

```sh
cd ~
git clone https://github.com/mikemcbride/dotfiles.git
```

Now we're going to install all the Homebrew applications:

```sh
cd ~/dotfiles && brew bundle
```

Now we're going to set up a bunch of symlinks to link things from this repo to the user directory:

```sh
mkdir -p ~/.zed
rm ~/.gitconfig
stow fish
stow nvim
stow bat
stow karabiner
stow starship
stow git
stow zed
```

We'll also install a Go binary that's used in some scripts. We should have Go set up from Homebrew at this point:

```sh
go get github.com/tj/node-prune
```

Now we've got some dependencies to install for those utility scripts to work. Let's do that now:

```sh
cd ~/dotfiles
yarn install
```

While we're in here, we probably want to set our file handling for common code file extensions to all open in Zed instead of whatever the OS decides to use to open the files:

```sh
cd ~/dotfiles
node ./scripts/setDefaultApplications.js
```

Next we need to add `fish` to our list of available shells, then we'll switch to using it:

```sh
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)
```

We'll install `fisher`, a plugin manager for the `fish` shell:

```sh
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```

If we're on an Apple Silicon Mac, we need to add a couple of directories to our `$PATH` so we can execute binaries installed via Homebrew. We'll also add our Go binaries path so anything we install with `go get` will be available to us as well (for starters, `node-prune`).

```sh
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew
fish_add_path (go env GOPATH)/bin
```

Add github-cli completions to fish:

```sh
gh completion -s fish > ~/.config/fish/completions/gh.fish
```

Finally, we'll install any plugins with fisher:

```sh
fisher install jethrokuan/z
fisher install rbenv/fish-rbenv
```

I love the Fish shell, but sometimes there are issues. In the circumstances when fish doesn't work well, I've got some configs for zsh that make it about the same as my fish setup.

- Install oh-my-zsh
- Run `stow zsh`
- Clone custom plugin repos to `~/.oh-my-zsh/custom/plugins/`:

```
zsh-autosuggestions
zsh-syntax-highlighting
zsh-z
```

The zshrc file and OMZ will take care of most of the aliases and setting up Starship. Fortunately Starship uses the same config file regardless of which shell is running.

Now if you need to switch to zsh, the experience should be pretty similar to what I get in fish.

### Install script

Mike, that's a lot of stuff to do...

It's really not bad, but if you want you can run the setup script to have it execute all of these commands in order.

```
sh ./setup.sh
```

## What just happened?

Got all that working? Great. Here's what we did:

- set your shell to fish
- installed [Homebrew](http://brew.sh)
- installed [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle) to make it easier to bulk install apps
- cloned this repo into `~/dotfiles` and set up your fish configs
- installed [starship](https://starship.rs) for managing our terminal prompt and set up a config for that
- set up Neovim config
- installed a few packages that I have aliases or functions for that will throw errors if you don't have them installed:
  - [z](http://github.com/jethrokuan/z) - super fast way to jump around files/folders
  - [tree](http://brewformulas.org/tree) - linux `tree` command to show file structure
  - [trash-cli](http://github.com/sindresorhus/trash-cli) - a safer way to delete
  - [fnm](https://github.com/Schniz/fnm) - for managing multiple versions of Node.js
  - [rbenv](https://github.com/rbenv/fish-rbenv) - for managing your Ruby versions/environment
  - [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) - the fanciest diffs
- installed some command line utilities:
  - [ripgrep](https://github.com/BurntSushi/ripgrep) - grep but like a million times better
  - [bat](https://github.com/sharkdp/bat) - a `cat` clone with awesome features
  - [wget](https://www.gnu.org/software/wget/) - better than curl for downloading resources from a url
- installed some services commonly used in development:
  - docker
  - rabbitmq
  - mongo
- installed a few desktop applications to make your life better:
  - iTerm2
  - [Raycast](https://raycast.com)
  - [Insomnia](https://insomnia.rest/)
  - Slack
  - [Kap](https://getkap.co/)
  - Karabiner Elements

## Additional Setup

This section is mostly just for me to remember what I still need to download/setup after running the install script.

### .macos

There's a `.macos` file that you can execute. It's taken from Mathias Bynens' famous `.macos` dotfile config with a ton of sensible macOS defaults.
I've tweaked it to add/remove items that are relevant for me. You can set the defaults by executing the script:

```sh
sh ~/dotfiles/.macos
```

### Logins

- Sign in to 1Password and add the browser extension.
- Download and install Arc and log in there
- You'll need to set up a new GitHub Personal Access Token to access GitHub from the command line.
- Open any file in vim and run `:PackerInstall` to install all plugins

### Shortcuts

You can set keyboard shortcuts for switching to specific workspaces (desktops) in Mission Control. System Preferences > Keyboard > Shortcuts > Mission Control. I like to set them to Hyper + {workspace number}, so Hyper+1 takes me to desktop 1. I haven't figured out how to do this inside of the .macos script yet, so for now it's a manual change.

### Raycast

In this repo there's a `/raycast/[file].rayconfig` that you can import to bring over all your Raycast preferences. It's password protected. The password is in 1Password.

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

Reinstall browser extensions. 1Password, Vue and React dev tools, JSON formatter, etc.

### Peripherals

Download and install the Logitech app to sync mouse config/preferences.

## Updating

As you make changes to the files, you can push those changes so your configs will never be lost. If you are running this to keep multiple machines in sync, you can just pull this repo down on other machines after pushing changes. Since all the files are symlinked, you won't have to re-run any scripts unless you create new files that also need to be linked.
