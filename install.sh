#!/usr/bin/env bash

set -ex

# Ensure XDG config directory is present
mkdir -p ~/.config

# Check for a brew install, and do the 
# base brew package set
container_brew_path="/home/linuxbrew/.linuxbrew/bin/brew"
if [ -z "$(which brew)"]; then
  if [ -f "$container_brew_path" ]; then
    eval "$($container_brew_path shellenv)"
  fi
fi

if [ -n "$(which brew)" ]; then
  cp Brewfile ~/.Brewfile
  brew bundle --global
fi

# install starship for that statusline bling
# execute after brew, as it's probably installing starship :)
if [ -n "$(which starship)" ]; then
  # assume using Bash in a docker context
  echo 'eval "$(starship init bash)"' > ~/.bashrc
fi

# Copy editor configurations
cp -R .config/helix ~/.config/

# Install Astro NVIM
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Copy $HOMEDIR-level files necessary for runtime
cp gitconfig ~/.gitconfig

