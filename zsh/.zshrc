# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load Znap
# Download Znap if not found
[[ -f ~/.config/zsh/plugins/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.config/zsh/plugins/zsh-snap

source $HOME/.config/zsh/plugins/zsh-snap/znap.zsh  # Start Znap

# Theme
znap source romkatv/powerlevel10k

# Powerline10k config
source $HOME/.p10k.zsh


autoload -U compinit && compinit -u
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Plugins
znap source ohmyzsh/ohmyzsh plugins/{git,sudo,dnf,alias-finder,autojump,bgnotify,gnu-utils}
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source zdharma/fast-syntax-highlighting
znap source marlonrichert/zsh-autocomplete

zstyle ':autocomplete:async' enabled no  
bgnotify_threshold=20

# History
HISTFILE="$HOME/.cache/zsh/history"
SAVEHIST=1000
HISTSIZE=1000

setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS

# Load Aliases
source $HOME/.alias
