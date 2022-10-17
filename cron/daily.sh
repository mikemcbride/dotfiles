#!/usr/bin/env bash

# call anything we want to run inside main.
main() {
    update_homebrew_apps()
}

# update homebrew then upgrade any of our outdated apps
update_homebrew_apps() {
    brew update && brew upgrade
}

# do the thing
main
