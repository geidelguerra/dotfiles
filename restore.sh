#!/usr/bin/bash
# Restore configuration files

REPO_DIR=$(cd -- "$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")" &>/dev/null && pwd)

CONFIG_DIRS=(
  alacritty
  btop
  fastfetch
  gh
  git
  ghostty
  hypr
  kitty
  mako
  nvim
  swayosd
  uwsm
  walker
  waybar
  zed
)

for dir in "${CONFIG_DIRS[@]}"; do
  rsync -avP "$REPO_DIR/.config/$dir" "$HOME/.config/"
done
