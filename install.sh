#!/bin/sh
#
# Install script for brugr's dotfiles
# https://github.com/brugr/dotfiles
#

set -e
clear

# Check if the required tools are installed
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

# Install oh-my-zsh
echo "Installing oh-my-zsh..."
export ZSH="$HOME/.config/oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "Installing dotfiles..."

git clone --bare https://github.com/brugr/dotfiles.git $HOME/.dotfiles    # Clone the main repo

if test -f "$HOME/.zshrc"    # Rename zshrc if it already exists
then
    mv $HOME/.zshrc $HOME/.zshrc.old
fi

git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout    # Checkout the files
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no    # Set git to not show untracked files

# Clone oh-my-zsh plugins
git clone https://github.com/marlonrichert/zsh-autocomplete.git $HOME/.config/oh-my-zsh/custom/plugins/zsh-autocomplete
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.config/oh-my-zsh/custom/plugins/zsh-syntax-highlighting

clear
echo "Done!"
echo "You will want to set zsh as your default shell"
echo "or reload it if you are already running it."
exit