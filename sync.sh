#!/usr/bin/env sh
# Copy configuration files to this repository

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
  rsync -avP --delete "$HOME/.config/$dir" "$REPO_DIR/.config/"
done

if [ -n "$(git status --porcelain)" ]; then
  git add . && git commit -m "sync" && git push
else
  echo "No changes to push."
fi
