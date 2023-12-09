# dotfiles

These are my dotfiles. It's here so that I don't lose any of my setups when switching to a new machine, but you are welcome to use any and all of the stuff included. I would, however, highly recommend forking this repo and changing my user name to yours to avoid any issues rather than just cloning it.

## Setup

It's worth noting that this setup is for macOS only and assumes you're using bash or zsh to execute the scripts. I have a goal to set this repo up to use git worktrees and have separate settings per OS, but for now it's macOS only since that's what I use for work.

One other important thing to note is that the Homebrew install location is different for Apple Silicon macs vs Apple Intel macs:

| Apple Silicon   | Intel        |
| --------------- | ------------ |
| `/opt/homebrew` | `/usr/local` |

You can set that prefix as an ENV variable if that would make things easier. For now, I'm going to assume Apple Silicon since they're phasing out the Intel macs, but just know that if you're using an Intel mac the Homebrew prefix is different so you'll need to tweak some of the scripts.

### Prerequisites

**OS Setup**

We need git and some other stuff that the Apple command line tools provides. We'll replace most of it with Homebrew alternatives since they're easier to update, but we need it to get started:

```shell
xcode-select --install
```

We will need write permissions to various folders in the `/usr/local` directory for the things we're going to install. We'll make sure they exist first. Run this to grant yourself those permissions:

```shell
sudo mkdir -p /usr/local/{bin,lib,include,share}
sudo mkdir -p /usr/local/share/zsh/site-functions
sudo chown -R $(whoami) /usr/local/{bin,lib,include,share}
```

**Node.js**

You need to have [Node.js](https://nodejs.org/en/download) installed. If you really are opposed to doing this you can install it with Homebrew, but I've had issues doing it that way in the past and prefer to manually install and manage versions using `fnm`. This setup assumes you are running the current LTS version or higher. Download and install it from the Node website before moving on.

**Rust**

There is a tmux plugin that requires Rust to compile it. Install Rust:

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

**1Password**

I used to tell you to install 1Password here, but that's no longer really necessary because we install it with Homebrew in just a minute. You shouldn't need to sign in to your Apple ID before running this setup, and you should be able to clone the GitHub repo without signing in too.

### Scripts

We'll start in the home directory. We're going to install some global node modules that we'll use to accomplish various things:

```sh
npm i -g empty-trash-cli fkill-cli np trash-cli convert-color-cli yarn vtop
```

> *NOTE*
> I used to install my dotfiles in my home directory, but I prefer to keep all my personal GitHub repos under the `~/personal` directory and all my work-related repos under `~/work`. This caused some hacks when dealing with my dotfiles because I always had to treat this repo differently. Luckily, you can pass a `target` flag to `stow` and override the default behavior.

Now that we've got all that installed, we'll set up the dotfiles:

```sh
mkdir -p ~/personal
cd ~/personal
git clone https://github.com/mikemcbride/dotfiles.git
```

Next we'll install [Homebrew](http://brew.sh). If you already have it, run `brew update` instead of installing it:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

We'll use Homebrew Bundle to look at our Bundle file and install a bunch of stuff:

```sh
brew tap Homebrew/bundle
cd ~/personal/dotfiles && brew bundle
```

Now we're going to set up a bunch of symlinks to link things from this repo to the user directory:

```sh
rm ~/.gitconfig
stow -t ~ {ghostty,kitty,nvim,bat,karabiner,starship,git,zed,bin,ripgrep,fish,zsh,tmux,ytdl}
```

We'll also install a Go binary that's used in some scripts. We should have Go set up from Homebrew at this point:

```sh
go install github.com/tj/node-prune@latest
```

Now we've got some dependencies to install for those utility scripts to work. Let's do that now:

```sh
cd ~/personal/dotfiles
npm install
```

While we're in here, we probably want to set our file handling for common code file extensions to all open in Zed instead of whatever the OS decides to use to open the files:

```sh
node ~/personal/dotfiles/scripts/setDefaultApplications.js
```

### Setup tmux plugins

The `.tmux.conf` file uses plugins - we manage those with TPM (tmux plugin manager). TPM is a git repo that we clone to run everything, so we don't include it inside this repo (yeah it could be a git submodule probably, but those are tedious and I'm lazy). First, we'll clone the repo into the desired folder:

```
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Next create a tmux session, and source the tmux conf file:

```sh
tmux new-session
tmux source-file ~/.tmux.conf
```

After that, press `prefix-I` to install TPM and all the plugins. Now TPM will be running with all plugins specified. This will ensure that tmux sessions are saved periodically and will persist across system restarts (thanks to tmux-resurrect and tmux-continuum).

### Choosing a shell

Everybody likes a "choose-your-own-adventure" story, right? Let's do that with our shell. I like the fish shell a lot, but zsh is far more popular and, often more importantly for my job, POSIX compliant (I run a lot of bash scripts). I have a setup for both shells that works pretty much the same. Just follow instructions below for whichever shell you prefer. In the `stow` command above we already set up both zsh and fish config files, so there's only a little setup left to do.

<details>
<summary>Install zsh</summary>

We'll install oh-my-zsh and install some plugins (we already have them defined in our zshrc).

```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
gh completion -s zsh > /usr/local/share/zsh/site-functions/_gh
```

Add zsh to our shells and set it as our preferred shell:

```sh
echo $(which zsh) | sudo tee -a /etc/shells
chsh -s $(which zsh)
source ~/.zshrc
```
</details>

<details>
<summary>Installing Fish</summary>

We've installed fish via homebrew already, so we'll install our config, then switch to fish.

```sh
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)
```

We'll install `fisher`, a plugin manager for the fish shell:

```sh
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```

If we're on an Apple Silicon Mac, we need to add a couple of directories to our `$PATH` so we can execute binaries installed via Homebrew. We'll also add our Go binaries path so anything we install with `go install` will be available to us as well (for starters, `node-prune`).

```sh
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew
fish_add_path (go env GOPATH)/bin
fish_add_path $HOME/.local/bin
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

</details>

:warning: You'll want to look at the `.tmux.conf` file to set the default shell. There are some lines commented out at the very bottom of the file. Two of the lines set zsh as the tmux shell, and two of them set fish as the shell. Comment/uncomment accordingly.

### Install script

Mike, that's a lot of stuff to do...

It's really not bad, but if you want you can run the setup script to have it execute all of these commands in order.

```
sh ./setup.sh
```

## What just happened?

Got all that working? Great. Here's what we did:

- set your shell to fish or zsh (depending what step you chose)
- installed [Homebrew](http://brew.sh)
- installed [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle) to make it easier to bulk install apps
- cloned this repo into `~/dotfiles` and set up your fish configs
- installed [starship](https://starship.rs) for managing our terminal prompt and set up a config for that
- set up Neovim config
- set up tmux config
- installed a few packages that I have aliases or functions for that will throw errors if you don't have them installed:
  - [z](http://github.com/agkozak/zsh-z) - super fast way to jump around files/folders
  - [tree](http://brewformulas.org/tree) - linux `tree` command to show file structure
  - [trash-cli](http://github.com/sindresorhus/trash-cli) - a safer way to delete
  - [fnm](https://github.com/Schniz/fnm) - for managing multiple versions of Node.js
  - [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) - the fanciest diffs
- installed some command line utilities:
  - [ripgrep](https://github.com/BurntSushi/ripgrep) - grep but like a million times better
  - [bat](https://github.com/sharkdp/bat) - a `cat` clone with awesome features
  - [wget](https://www.gnu.org/software/wget/) - better than curl for downloading resources from a url
- installed a few desktop applications to make your life better:
  - Kitty terminal
  - [1Password](https://1password.com)
  - [Raycast](https://raycast.com)
  - [Insomnia](https://insomnia.rest/)
  - Slack
  - [Kap](https://getkap.co/)
  - Karabiner Elements (custom keymaps on macOS) and applied a Karabiner config

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
- Set up a new GitHub Personal Access Token to access GitHub from the command line.
- Open any file in Neovim and run `:Lazy` to make `lazy.nvim` install all plugins

### Raycast

In this repo there's a `/raycast/[file].rayconfig` that you can import to bring over all your Raycast preferences. It's password protected. The password is in 1Password.

### More Apps to Install

Here are some apps that aren't available for download via Homebrew cask that you'll currently need to download manually:

- Pixelmator Pro (App Store)
- Bartender (website)
- Battery Indicator (App Store)
- Any fonts you want installed (grab Fonts folder from iCloud)

### Browser Extensions

Reinstall browser extensions. Arc might remember these? Not 100% sure.

### Peripherals

Download and install the Logitech app to sync mouse config/preferences.

## Updating

As you make changes to the files, you can push those changes so your configs will never be lost. If you are running this to keep multiple machines in sync, you can just pull this repo down on other machines after pushing changes. Since all the files are symlinked, you won't have to re-run any scripts unless you create new files that also need to be linked.
