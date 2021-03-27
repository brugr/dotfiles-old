<h1 align=center>.dotfiles</h1>

This is a git repo with my dotfiles using [GNU Stow](https://www.gnu.org/software/stow/). Can also be used on macOS with [linuxify](https://github.com/fabiomaia/linuxify).

## Installing

Stow is pretty easy to use. To install a package, change your directory into the dotfiles and run

    $ stow <package/folder> -t ~/

and to uninstall run

    $ stow -D <package/folder> -t ~/

It's that simple!

## Packages

Currently there are only 2 packages and those are:

**zsh**

<img src="https://i.imgur.com/meO0dAi.png" height="200px">

Uses [powerlevel10k](https://github.com/romkatv/powerlevel10k) for the theme, and has [fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting), [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) as plugins. You will need a custom font from [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts).

**kitty**

My prefered terminal emulator. My config changes some keybindings, sets the color scheme to the [nord-kitty](https://github.com/connorholyday/nord-kitty) theme and sets FiraCode Nerd Font as the font.

**rofi**

Just sets the theme to [nord-rofi](https://github.com/amayer5125/nord-rofi).

**dwm-autostart**

Scripts to autostart certain applications, to be used with my build of [dwm](https://github.com/brugr/dwm).

**clearine**

Configuration for my prefered logout/power UI.

**clearine-theme**

Icons for Cleaine. **SHOULD BE INSTALLED TO `/` ROOT**
    
    # stow clearine-theme -t /
