# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load Znap
# Download Znap if not found
[[ -f ~/.cache/zsh-snap/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.cache/zsh-snap/zsh-snap

source $HOME/.cache/zsh-snap/zsh-snap/znap.zsh  # Start Znap

# Theme
znap source romkatv/powerlevel10k

# Powerline10k config
source $HOME/.p10k.zsh

# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Plugins
znap source ohmyzsh/ohmyzsh plugins/{cp,docker,docker-compose,git,gh,history,sudo,dnf,alias-finder,autojump,gnu-utils}
znap source zsh-users/zsh-autosuggestions
znap source zdharma/fast-syntax-highlighting

# History
HISTFILE="$HOME/.cache/zsh/history"
SAVEHIST=1000
HISTSIZE=1000

setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS

# Bind home, end and del to normal behaviour
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# Load Aliases
source $HOME/.alias

# Distrobox run on host
command_not_found_handle() {
# don't run if not in a container
  if [ ! -e /run/.containerenv ] && [ ! -e /.dockerenv ]; then
    exit 127
  fi
  
  distrobox-host-exec "${@}"
}
if [ -n "${ZSH_VERSION-}" ]; then
  command_not_found_handler() {
    command_not_found_handle "$@"
 }
fi

