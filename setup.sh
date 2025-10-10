#!/usr/bin/bash
# Setups machine with dotfiles and install packages

# get current script dir
REPO_DIR=$(cd -- "$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")" &>/dev/null && pwd)

# Escalate privileges to ensure the script has the necessary permissions
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or use sudo to execute this script."
    exit 1
fi

# Create a symbolic link to sync.sh as syncdotfiles
ln -sf "$REPO_DIR/sync.sh" /usr/local/bin/syncdotfiles
chmod +x /usr/local/bin/syncdotfiles

# Add Chaotic-AUR repository
if ! grep -q "\[chaotic-aur\]" /etc/pacman.conf; then
    pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
    pacman-key --lsign-key 3056513887B78AEB
    pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
    pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
    echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf
    packman -Syu --noconfirm
fi
