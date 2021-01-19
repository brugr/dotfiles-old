#!/bin/sh
#
# Install script for brugr's dotfiles
# https://github.com/brugr/dotfiles
#

alias dfg='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

set -e
clear

# Check if the required packages are installed
if ! command -v zsh >/dev/null 2>&1
then
    echo "zsh is not installed, now exiting."
    exit
fi
if ! command -v curl >/dev/null 2>&1
then
    echo "curl is not installed, now exiting."
    exit
fi
if ! command -v git >/dev/null 2>&1
then
    echo "git is not installed, now exiting."
    exit
fi

# Install antigen
echo "Installing Antigen..."
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/bin/antigen.zsh > $HOME/.config/zsh/antigen/antigen.zsh

# Clone dotfiles
echo "Installing dotfiles..."
git clone --bare https://github.com/brugr/dotfiles.git $HOME/.dotfiles

# Checkout files
mkdir -p .config-backup && \
dfg checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

dfg config --local status.showUntrackedFiles no    # Set git to not show untracked files

clear
echo "Done!"
echo "You will want to set zsh as your default shell"
echo "or reload it if you are already running it."
exit