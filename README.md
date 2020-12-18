# .dotfiles

This is a bare git repo with my dotfiles for use on multiple distros with ZSH.

## How to install

Requirements:

* ZSH
* fzf
* curl
* git

### Part 1

#### Setting up [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)

Install oh-my-zsh this command.

```sh
export ZSH="$HOME/.config/oh-my-zsh" && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

It will install oh-my-zsh under ``~/.config/oh-my-zsh/``

### Part 2

#### Setting up the repo

First clone the repo using this command.

```sh
git clone --bare https://github.com/brugr/dotfiles.git $HOME/.dotfiles
```

This will clone the repo as a bare repo into ``~/.dotfiles/``

We now need to add the files into your home directory. Make sure you have no conflicting files, otherwise git will complain.  
You only need to use these paramaters now, afterwards you can just use ``dfg``

```sh
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
```

Now reload ``.zshrc``

```sh
source ~/.zshrc
```

You will encounter a error that says ``no such file or directory: /home/{username}/.config/aliases/pkgmgr`` We will fix this later.

We will now prevent untracked files from showing up when using ``dfg``

```sh
dfg config --local status.showUntrackedFiles no
```

### Part 3

#### Fixing aliases

The dotfiles contains aliases for some package managers, but since i don't know what package manager you use, we'll have to fix this manually.

Change directory into ``~/.config/aliases/``

```sh
cd ~/.config/aliases/
```

We now need to symlink one of the provided configs so that the aliases work.  
The available ones are:

``pkgmgr-apt``: For Debian based distros, such as Ubuntu, Linux Mint.  
``pkgmgr-dnf``: For Fedora.

Let's symlink one of them.

```sh
ln -srv {your choice} pkgmgr
```

Now reload ``.zshrc``

```sh
rzsh
```

And you are done!
