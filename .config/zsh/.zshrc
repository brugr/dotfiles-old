# Set env variables
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ADOTDIR="$ZDOTDIR/antigen"

# Load Antigen
source $ADOTDIR/antigen.zsh

# Set Theme
antigen theme essembeh

# Load oh-my-zsh
antigen use oh-my-zsh

# Plugins
antigen bundle sudo
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Apply
antigen apply

# History
HISTFILE="$HOME/.history"
SAVEHIST=5000
HISTSIZE=5000

setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "

setopt EXTENDED_HISTORY

setopt HIST_FIND_NO_DUPS

# Load Nord dircolors
# https://github.com/arcticicestudio/nord-dircolors
test -r "$ZDOTDIR/dircolors" && eval $(dircolors $ZDOTDIR/dircolors)

# Load Aliases
source ~/.config/zsh/alias
