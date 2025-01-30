#!/usr/bin/env sh

cp ~/.gitconfig .
cp ~/.shell_paths .
cp ~/.tmux.conf .
cp ~/.zshrc .

rsync -a --delete ~/.config/ghostty .config/
rsync -a --delete ~/.config/nvim/init.lua .config/nvim/
rsync -a --delete ~/.config/zed .config/

git add . && git commit -m 'sync' && git push origin master
