# Load Antigen
source $ZDOTDIR/antigen.zsh

# Set Theme
antigen theme romkatv/powerlevel10k

# Plugins
antigen bundle $HOME/.config/zsh/plugins
antigen bundle zdharma/fast-syntax-highlighting@main
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

# Load Aliases
source ~/.config/zsh/alias

# Powerline10k
source ~/.config/zsh/.p10k.zsh
