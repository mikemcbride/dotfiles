#!/bin/bash

target="${1:-/Applications}"

check() {
  stat "$1/Contents/Frameworks/Electron Framework.framework" &> /dev/null
  if [[ $? = 0 ]]; then
    echo "$1 uses Electron"
  fi
}

export -f check

find "$target" -maxdepth 2 -type d -name "*.app" -exec bash -c 'check "{}"' \;
