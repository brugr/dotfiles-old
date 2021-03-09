<h1 align=center>.dotfiles</h1>

This is a git repo with my dotfiles using [GNU Stow](https://www.gnu.org/software/stow/). Can also be used on macOS with [linuxify](https://github.com/fabiomaia/linuxify).

## Installing

Stow is pretty easy to use. To install a package, change your directory into the dotfiles and run

```sh
stow <package/folder> -t ~/
```

and to uninstall run

```sh
stow -D <package/folder> -t ~/
```

It's that simple!

## Packages

Currently there are only 2 packages and those are:

* **zsh**
* **dwm-autostart**