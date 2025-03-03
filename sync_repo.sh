#!/usr/bin/env sh

REPO_DIR=$HOME/projects/personal/dotfiles/

cp ~/.gitconfig $REPO_DIR
cp ~/.shell_paths $REPO_DIR
cp ~/.tmux.conf $REPO_DIR
cp ~/.zshrc $REPO_DIR

rsync -a --delete ~/.config/ghostty $REPO_DIR/.config/
rsync -a --delete ~/.config/nvim/init.lua $REPO_DIR/.config/nvim/
rsync -a --delete ~/.config/zed $REPO_DIR/.config/

cd $REPO_DIR
git add . && git commit -m 'sync' && git push origin master
cd -
