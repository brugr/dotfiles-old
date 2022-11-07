# Download P10K if not found
#[[ -f ~/.config/p10k/powerlevel10k.zsh-theme ]] ||
#    git clone --depth 1 -- \
#        https://github.com/romkatv/powerlevel10k.git ~/.config/p10k
#
#source ~/.config/p10k/powerlevel10k.zsh-theme  # Load P10K

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

# P10K
znap source romkatv/powerlevel10k

# Plugins
znap source ohmyzsh/ohmyzsh plugins/{git,sudo,dnf,aliases,alias-finder}
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source zdharma/fast-syntax-highlighting
znap source marlonrichert/zsh-autocomplete

zstyle ':autocomplete:async' enabled no  

# History
HISTFILE="$HOME/.history"
SAVEHIST=5000
HISTSIZE=5000

setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS

# Load Aliases
source $HOME/.alias

# Powerline10k
source $HOME/.p10k.zsh
