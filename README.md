# .dotfiles

This is a bare git repo with my dotfiles for use on multiple distros with ZSH.

## How to install

Requirements:

* zsh
* curl
* git

### Automatic way

You can install the dotfiles by using this single command.

```sh
sh -c "$(curl -fsSL https://git.io/Jtqmx)"
```

If you don't feel comfortable just running this script, you can download the script, look through so that it looks normal, then run it.

```sh
curl https://git.io/Jtqmx -o install.sh
sh install.sh
```

Or you can to it the manual way below.

### Manual way

### Part 1

#### Install [Antigen](https://github.com/ohmyzsh/ohmyzsh)

Install Antigen with this command.

```sh
curl -L git.io/antigen > $HOME/.config/zsh/antigen/antigen.zsh
```

It will install Antigen under ``~/.config/zsh/antigen/``

### Part 2

#### Setting up the repo

First clone the repo using this command.

```sh
git clone --bare https://github.com/brugr/dotfiles.git $HOME/.dotfiles
```

This will clone the repo as a bare repo into ``~/.dotfiles/``

We will now prevent untracked files from showing up when using ``dfg``

```sh
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
```

We now need to add the files into your home directory. Make sure you have no conflicting files, otherwise git will complain.  
You only need to use these paramaters now, afterwards you can just use the alias ``dfg``

```sh
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
```

Now reload ``.zshrc``

```sh
source ~/.zshrc
```

And you are done!
