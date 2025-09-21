#!/usr/bin/env sh

REPO_DIR=$HOME/projects/personal/dotfiles/

rsync -a --delete ~/.gitconfig $REPO_DIR/
rsync -a --delete ~/.config/ghostty $REPO_DIR/.config/
rsync -a --delete ~/.config/nvim/init.lua $REPO_DIR/.config/nvim/
rsync -a --delete ~/.config/zed $REPO_DIR/.config/
rsync -a --delete ~/.config/alacritty $REPO_DIR/.config/
rsync -a --delete ~/.config/hypr $REPO_DIR/.config/
rsync -a --delete ~/.config/waybar $REPO_DIR/.config/
rsync -a --delete ~/.config/Code/User/settings.json $REPO_DIR/.config/Code/User/
rsync -a --delete ~/.config/Code/User/keybindings.json $REPO_DIR/.config/Code/User/

cd $REPO_DIR
git add . && git commit -m 'sync' && git push origin master
cd -
