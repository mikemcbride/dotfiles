# Cleanup and Health Check

Here's a list of stuff to run to keep your Mac clean and free up space and all that goodness.

As a fun exercise, if you want to see how much space you free up by running through this list, you can check available space before and after:

```sh
diskutil info / | grep "Free Space"
```

## Homebrew

Some commands to run to tidy up your Homebrew environment.
```sh
brew update
brew upgrade
brew cleanup -s
brew cask cleanup
```
- `brew update` will update the local database of available packages and versions.
- `brew upgrade` will actually upgrade the ones you have installed to the latest. You can also run `brew upgrade {package}` to only upgrade an individual package to the latest version, like `brew upgrade vim`.
- `brew cleanup` will remove old versions of packages. The `-s` flag does this, which frees up even more space:
    > Scrub the cache, including downloads for even the latest versions. Note downloads for any installed formulae or casks will still not be deleted. If you want to delete those too: `rm -rf "$(brew --cache)"`
- `brew cask cleanup` will clean up the cache for unfinished downloads of any casks you make have installed.

For general Homebrew maintenance,  `brew doctor` and `brew missing` are diagnostic tools to find any problems with the installation and fix issues. Run these anytime. `brew doctor` will give you some additional commands to run to actually perform the chores - it won't do it for you.

## Git

Remove all local branches that have been merged into master:

```sh
git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d
```

I run this so frequently in my repos I have a fish function set up to do this for me: `gcl` for "git clean" (at least that's how I remember it so that's what I call it).

## Node Modules

![node modules suck](https://camo.githubusercontent.com/98d81a9061d57563e0dfcf8a447e9142c97547e618719b9a4a7f9202fa911d12/68747470733a2f2f7062732e7477696d672e636f6d2f6d656469612f444549565f3158577341416c5932392e6a7067)

The bane of my existence. There are a few strategies here. You can straight up remove the `node_modules` folder in folders older than X number of days:

```sh
# change +120 to whatever number you want
find . -name "node_modules" -type d -mtime +120 | xargs rm -rf
```

The downside is that you have to re-run `npm install` or `yarn install` before running that app again, but after 4 months... you probably want to pull in the latest changes and reinstall anyway.

Another approach is to selectively remove `node_modules` using a tool like [`npkill`](https://npkill.js.org/):

```sh
npx npkill
```

Run this in a directory with your projects and it will give you an interactive CLI listing all the subdirectories with `node_modules` and tell you how much space it's taking up. Then you can go line by line and choose which ones you want to remove. I like to run `npx npkill -s space` to have it sort the subdirectories by total size, so the largest `node_modules` show up at the top of the list.

Another alternative is to remove unnecessary files from `node_modules` folders. It won't clean up as much space as removing the folder completely of course, but it also means you won't have to re-run `npm install`. Using a package called [node-prune](https://github.com/tj/node-prune), we can remove files that may have been published with a package that aren't necessary for us to use it. You can use the `files` array when publishing a package to npm to indicate which files in your repository should get published as part of the package. If you omit this, it will publish everything, and quite commonly this is unnecessary. I don't need your README, Gulpfile, Jenkinsfile, ESLint config, changelog, or your tests in my `node_modules` folder because they aren't necessary for me to use for your package to work. `node-prune` will remove a ton of these files and directories based on common names/patterns. You can run `node-prune` in the directory you want to have it prune. I have [a script](./scripts/prune.js) that I can execute from my projects folder and it will run `node-prune` in every subdirectory. Again, this doesn't save as much space as totally wiping out `node_modules` (naturally), but you'd be surprised how much stuff it removes.

## Node

If you're using a version manager for Node (how in the world are you not?), you can clean up old versions. I use `n`, and you can run this:

```sh
# see which versions you have installed
n ls
# remove a desired version
n rm [version]
```

If you're using `nvm` it's a similar process:

```sh
nvm ls
nvm uninstall [version]
```

## Docker

You can remove volumes not used by at least one container:

```sh
docker volume prune
```

## How did you do?

If you ran through this list, you can see how much space you freed up. Make sure you empty your trash first, then run this again and compare the size to what it was before we started:

```sh
diskutil info / | grep "Free Space"
```
