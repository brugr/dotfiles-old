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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/brugr/dotfiles/installer/install.sh)"
```

If you don't feel comfortable just running this script, you can download the script, look through so that it looks normal, then run it.

```sh
curl https://raw.githubusercontent.com/brugr/dotfiles/installer/install.sh -o install.sh
sh install.sh
```

Or you can to it the manual way below.

### Manual way

### Part 1

#### Setting up [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)

Install oh-my-zsh with this command.

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
You only need to use these paramaters now, afterwards you can just use the alias ``dfg``

```sh
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
```

Now reload ``.zshrc``

```sh
source ~/.zshrc
```

We will now prevent untracked files from showing up when using ``dfg``

```sh
dfg config --local status.showUntrackedFiles no
```

### Part 3

#### Cloning plugins

We now need to clone some plugins that will be loaded by `.zshrc`

The first one is [zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete)

```sh
git clone https://github.com/marlonrichert/zsh-autocomplete.git $ZSH/custom/plugins/zsh-autocomplete
```

and the second one is [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/custom/plugins/zsh-syntax-highlighting
```

Now reload ``.zshrc``

```sh
rzsh
```

And you are done!
