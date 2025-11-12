#!/usr/bin/bash
# Restore configuration files
set -ex

# Store the script's directory
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
    SOURCE_DIR="$REPO_DIR/.config/$dir"
    TARGET_DIR="$HOME/.config/$dir"

    if [ -L "$TARGET_DIR" ] || [ -d "$TARGET_DIR" ]; then
        mv "$TARGET_DIR" "${TARGET_DIR}_backup_$(date +%Y%m%d)"
    fi

    ln -sf "$REPO_DIR/.config/$dir" "$HOME/.config/"
done

omarchy-restart-waybar
omarchy-restart-hypridle
omarchy-restart-swayosd
omarchy-restart-hyprsunset
