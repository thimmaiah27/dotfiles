# Enable colors and change prompt
# autoload -U colors && colors
#PROMPT="
#%B%F{#ff5f00}%n%f%F{white}@%f%F{#87ff00}%M%f %F{white}in%f %F{#00ff87}%2~%f     
#%F{white}$%f %b"





# prompt spaceship
# Spaceship prompt configuration
autoload -U promptinit; promptinit

# function to show python virtual environment
function spaceship_venv() {
  [[ $SPACESHIP_VENV_SHOW == false ]] && return
  [[ -z $VIRTUAL_ENV ]] && return

  local venv_name=$(basename "$VIRTUAL_ENV")
  spaceship::section \
    --color "$SPACESHIP_VENV_COLOR" \
    --prefix "$SPACESHIP_VENV_PREFIX" \
    --suffix "$SPACESHIP_VENV_SUFFIX" \
    --symbol "$SPACESHIP_VENV_SYMBOL" \
    "$venv_name"
}


SPACESHIP_VENV_SHOW=true
SPACESHIP_VENV_PREFIX="("
SPACESHIP_VENV_SUFFIX=") "
SPACESHIP_VENV_COLOR="cyan"
SPACESHIP_VENV_SYMBOL=""

SPACESHIP_PROMPT_ORDER=(
  user
  dir
  git
  venv
  python      
  node
  exec_time
  line_sep 
  exit_code
  char
)

# Configure python section to show virtual environment
SPACESHIP_PYTHON_SHOW=true
SPACESHIP_PYTHON_ASYNC=false
SPACESHIP_PYTHON_PREFIX="via "
SPACESHIP_PYTHON_SUFFIX=" "
SPACESHIP_PYTHON_SYMBOL=" "
SPACESHIP_PYTHON_COLOR="yellow"
SPACESHIP_CHAR_SYMBOL="❯ "
SPACESHIP_CHAR_COLOR_SUCCESS="green"
SPACESHIP_CHAR_COLOR_FAILURE="red"

prompt spaceship




# History configuration
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS

# Basic auto/tab complete
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)  # Include hidden files

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward

# Edit line in vim buffer
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^v' edit-command-line
bindkey -M vicmd '^v' edit-command-line

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Fix backspace bug when switching modes
bindkey '^?' backward-delete-char

# Change cursor shape for different vi modes
function zle-keymap-select {
  case $KEYMAP in
    vicmd) echo -ne '\e[1 q';;
    viins|main) echo -ne '\e[5 q';;
  esac
}
zle -N zle-keymap-select

# ci", ci', ci`, di", etc
autoload -Uz select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# ci{, ci(, ci<, di{, etc
autoload -Uz select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

# Set beam shape cursor on startup and for each new prompt
function zle-line-init {
    zle -K viins
    echo -ne '\e[5 q'
}
zle -N zle-line-init
precmd() { echo -ne '\e[5 q'; }

# Source aliases and plugins
[ -f "$HOME/.config/shell-scripts/aliasrc" ] && source "$HOME/.config/shell-scripts/aliasrc"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/doc/pkgfile/command-not-found.zsh 2>/dev/null

# Syntax highlighting configuration
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=green'

# Run neofetch if it's installed
command -v fastfetch >/dev/null && fastfetch
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ls='exa --icons'
