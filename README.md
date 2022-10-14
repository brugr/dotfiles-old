# dotfiles

This is a git repo with my dotfiles using [GNU Stow](https://www.gnu.org/software/stow/). Can also be used on macOS with [linuxify](https://github.com/fabiomaia/linuxify).

## Installing

Stow is pretty easy to use. To install a package, change your directory into the dotfiles and run

    $ stow <package/folder> -t ~/

and to uninstall run

    $ stow -D <package/folder> -t ~/

## Packages

### zsh

Uses [powerlevel10k](https://github.com/romkatv/powerlevel10k) for the theme, and has [fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting), [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) as plugins. You will need a custom font from [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts).
