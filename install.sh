#!/usr/bin/env sh

set -exuo pipefail

# Ensure XDG config directory is present
mkdir -p ~/.config

# install starship for that statusline bling
if [ -n $(which starship) ]; then
  # assume using Bash in a docker context
  echo 'eval "$(starship init bash)"' > ~/.bashrc
fi

if [ -n $(which brew) ]; then
  cp Brewfile ~/.Brewfile
  brew bundle --global
fi


# Copy editor configurations
cp -R .config/helix ~/.config/

# Install Astro NVIM
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Copy $HOMEDIR-level files necessary for runtime
cp gitconfig ~/.gitconfig

