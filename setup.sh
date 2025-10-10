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
